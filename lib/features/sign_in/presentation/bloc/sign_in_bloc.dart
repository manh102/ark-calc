import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ark_calc/core/util/core_util.dart';
import 'package:new_ark_calc/features/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:new_ark_calc/features/sign_in/presentation/bloc/sign_in_event.dart';
import 'package:new_ark_calc/features/sign_in/presentation/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;
  final _auth = FirebaseAuth.instance;

  TextEditingController phoneController = TextEditingController();

  /// phoneNumber
  String _phoneNumber = "";

  String get phoneNumber => _phoneNumber;

  /// The phone auth verification ID.
  String? _verificationId;

  String? get verificationId => _verificationId;

  /// autoRetrievalTimeOutDuration
  static const kAutoRetrievalTimeOutDuration = Duration(minutes: 1);

  /// The [_forceResendingToken] obtained from [codeSent]
  /// callback to force re-sending another verification SMS before the
  /// auto-retrieval timeout.
  int? _forceResendingToken;

  /// linkWithExistingUser
  late bool _linkWithExistingUser;

  /// signOutOnSuccessfulVerification
  late bool _signOutOnSuccessfulVerification;

  /// onCodeSent
  VoidCallback? _onCodeSent;

  /// Whether OTP to the given phoneNumber is sent or not.
  bool codeSent = false;

  /// Timer object for OTP expiration.
  Timer? _otpExpirationTimer;

  Timer? get otpAutoRetrievalTimer => _otpAutoRetrievalTimer;

  static Duration get otpExpirationDuration => _otpExpirationDuration;

  /// otpExpirationDuration
  static Duration _otpExpirationDuration = kAutoRetrievalTimeOutDuration;

  /// Timer object for SMS auto-retrieval.
  Timer? _otpAutoRetrievalTimer;

  /// autoRetrievalTimeOutDuration
  static Duration _autoRetrievalTimeOutDuration = kAutoRetrievalTimeOutDuration;

  SignInBloc({required this.signInUseCase}) : super(SignInInitial()) {
    _linkWithExistingUser = false;
    _signOutOnSuccessfulVerification = false;

    // When user clicks on send otp button then this event will be fired
    on<SendOtpToPhoneEvent>(
      (event, emit) {
        _phoneNumber = event.phoneNumber;
        _onSendOtp(event, emit);
      },
    );

    // After receiving the otp, When user clicks on verify otp button then this event will be fired
    on<VerifySentOtpEvent>(
      (event, emit) {
        _verificationId = event.verificationId;
        _onVerifyOtp(event, emit);
      },
    );

    // When the firebase sends the code to the user's phone, this event will be fired
    on<OnPhoneOtpSent>((event, emit) =>
        emit(SignInOtpCodeSentSuccess(verificationId: event.verificationId)));

    // When any error occurs while sending otp to the user's phone, this event will be fired
    on<OnPhoneAuthErrorEvent>((event, emit) =>
        emit(SignInError(messageCode: '', messageContent: event.error)));

    // When the otp verification is successful, this event will be fired
    on<OnSignInVerificationCompleteEvent>(_loginWithCredential);

    on<DoLoginAndStoreInformationEvent>(_loginAtServerAndStoreInformation);
  }

  /// Send OTP to the given [_phoneNumber].
  ///
  /// Returns true if OTP was sent successfully.
  ///
  /// If for any reason, the OTP is not send,
  /// [_onLoginFailed] is called with [FirebaseAuthException]
  /// object to handle the error.
  ///
  /// [shouldAwaitCodeSend] can be used to await the OTP send.
  /// The firebase method completes early, and if [shouldAwaitCodeSend] is false,
  /// [sendOTP] will complete early, and the OTP will be sent in the background.
  /// Whereas, if [shouldAwaitCodeSend] is true, [sendOTP] will wait for the
  /// code send callback to be fired, and [sendOTP] will complete only after
  /// that callback is fired. Not applicable on web.
  Future<bool> _onSendOtp(
      SendOtpToPhoneEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoading());

    Completer? codeSendCompleter;
    codeSent = false;

    verificationCompleted(AuthCredential authCredential) async {
      // On [verificationComplete], we will get the credential from the firebase and will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
      add(OnSignInVerificationCompleteEvent(
          credential: authCredential, autoVerified: true));
    }

    codeSentCallback(
      String verificationId, [
      int? forceResendingToken,
    ]) async {
      _verificationId = verificationId;
      _forceResendingToken = forceResendingToken;
      codeSent = true;
      _onCodeSent?.call();
      if (codeSendCompleter != null && !codeSendCompleter.isCompleted) {
        codeSendCompleter.complete();
      }
      _setTimer();

      // On [codeSent], we will get the verificationId and the resendToken from the firebase and will send it to the [OnPhoneOtpSent] event to be handled by the bloc and then will emit the [OnPhoneAuthVerificationCompleteEvent] event after receiving the code from the user's phone
      add(OnPhoneOtpSent(
          verificationId: _verificationId, token: forceResendingToken));
    }

    verificationFailedCallback(FirebaseAuthException authException) {
      // On [verificationFailed], we will get the exception from the firebase and will send it to the [OnPhoneAuthErrorEvent] event to be handled by the bloc and then will emit the [PhoneAuthError] state in order to display the error to the user's screen
      add(OnPhoneAuthErrorEvent(error: authException.code));
    }

    codeAutoRetrievalTimeoutCallback(String verificationId) {
      _verificationId = verificationId;
    }

    try {
      codeSendCompleter = Completer();
      await _auth.verifyPhoneNumber(
          phoneNumber: _phoneNumber.trim(),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailedCallback,
          codeSent: codeSentCallback,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeoutCallback,
          timeout: _autoRetrievalTimeOutDuration,
          forceResendingToken: _forceResendingToken);

      if (event.shouldAwaitCodeSend) await codeSendCompleter.future;

      return true;
    } on FirebaseAuthException catch (e) {
      emit(SignInError(messageCode: "", messageContent: e.message ?? ""));
      return false;
    } catch (e, s) {
      emit(SignInError(messageCode: "", messageContent: s.toString()));
      return false;
    }
  }

  /// Verify the OTP sent to [_phoneNumber] and login user is OTP was correct.
  ///
  /// Returns true if the [otp] passed was correct and the user was logged in successfully.
  /// On login success, [_onLoginSuccess] is called.
  ///
  /// If the [otp] passed is incorrect, or the [otp] is expired or any other
  /// error occurs, the functions returns false.
  ///
  /// Also, [_onLoginFailed] is called with [FirebaseAuthException]
  /// object to handle the error.
  Future<bool> _onVerifyOtp(
      VerifySentOtpEvent event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoading());
      // After receiving the otp, we will verify the otp and then will create a credential from the otp and verificationId and then will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otpCode,
      );
      add(OnSignInVerificationCompleteEvent(
          credential: credential, autoVerified: false));
      return true;
    } on FirebaseAuthException catch (e) {
      emit(SignInError(messageCode: "", messageContent: e.message ?? ""));
      return false;
    } catch (e) {
      emit(SignInError(messageCode: "", messageContent: e.toString()));
      return false;
    }
  }

  /// Called when the otp is verified either automatically (OTP auto fetched)
  /// or [verifyOtp] was called with the correct OTP.
  ///
  /// If true is returned that means the user was logged in successfully.
  ///
  /// If for any reason, the user fails to login,
  /// [_onLoginFailed] is called with [FirebaseAuthException]
  /// object to handle the error and false is returned.
  Future<bool> _loginWithCredential(OnSignInVerificationCompleteEvent event,
      Emitter<SignInState> emit) async {
    // After receiving the credential from the event, we will login with the credential and then will emit the [PhoneAuthVerified] state after successful login
    try {
      emit(SignInLoading());

      late final UserCredential authResult;
      if (_linkWithExistingUser) {
        authResult =
            await _auth.currentUser!.linkWithCredential(event.credential);
      } else {
        authResult = await _auth.signInWithCredential(event.credential);
      }

      if (authResult.user != null) {
        add(DoLoginAndStoreInformationEvent(
            phoneNumber: _phoneNumber,
            accessToken: await authResult.user!.getIdToken(true)));
      }

      if (_signOutOnSuccessfulVerification) await signOut();

      return true;
    } on FirebaseAuthException catch (e) {
      emit(SignInError(messageCode: "", messageContent: e.message ?? ""));
    } catch (e) {
      emit(SignInError(messageCode: "", messageContent: e.toString()));
    }

    return false;
  }

  /// Set timer after code sent.
  void _setTimer() {
    _otpExpirationTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timer.tick == _otpExpirationDuration.inSeconds) {
          _otpExpirationTimer?.cancel();
        }
        try {
          //notifyListeners();
        } catch (_) {}
      },
    );
    _otpAutoRetrievalTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timer.tick == _autoRetrievalTimeOutDuration.inSeconds) {
          _otpAutoRetrievalTimer?.cancel();
        }
        try {
          // notifyListeners();
        } catch (_) {}
      },
    );
    // notifyListeners();
  }

  /// signOut
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// Clear all data when reset to a new session
  void clear() {
    codeSent = false;
    _onCodeSent = null;
    _signOutOnSuccessfulVerification = false;
    _otpExpirationTimer?.cancel();
    _otpExpirationTimer = null;
    _otpAutoRetrievalTimer?.cancel();
    _otpAutoRetrievalTimer = null;
    _linkWithExistingUser = false;
    _autoRetrievalTimeOutDuration = kAutoRetrievalTimeOutDuration;
    _otpExpirationDuration = kAutoRetrievalTimeOutDuration;
    _verificationId = null;
  }

  Future _loginAtServerAndStoreInformation(
      DoLoginAndStoreInformationEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoading());

    try {
      Logging.log.debug("firebaseToken: ${event.accessToken}");
      final result = await signInUseCase(SignInRequest(
          phoneNumber: '123456789',
          accessToken: event.accessToken,
          countryCode: '123'));

      await result.fold((responseFail) async {
        Logging.log
            .info("${responseFail.msgCode} : ${responseFail.msgContent}");

        emit(SignInError(
            messageCode: responseFail.msgCode,
            messageContent: responseFail.msgContent));
        return false;
      }, (responseSuccess) async {
        emit(SignInPhoneAuthVerified());
        return true;
      });
    } catch (ex) {
      Logging.log.info(ex.toString());
      emit(SignInError(messageCode: "", messageContent: "Error"));
      return false;
    }
  }
}
