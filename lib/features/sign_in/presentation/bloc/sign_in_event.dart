import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

/// This event will be triggered when the user enters the phone number and presses the Send OTP button on the UI.
class SendOtpToPhoneEvent extends SignInEvent {
  final String phoneNumber;
  final bool shouldAwaitCodeSend;

  const SendOtpToPhoneEvent(
      {required this.phoneNumber, this.shouldAwaitCodeSend = true});

  @override
  List<Object?> get props => [phoneNumber];
}

/// This event will be triggered when the user enters the OTP and presses the Verify OTP button on the UI.
class VerifySentOtpEvent extends SignInEvent {
  final String otpCode;
  final String verificationId;

  const VerifySentOtpEvent({
    required this.otpCode,
    required this.verificationId,
  });

  @override
  List<Object?> get props => [otpCode, verificationId];
}

/// This event will be triggered when firebase sends the OTP to the user's phone number.
class OnPhoneOtpSent extends SignInEvent {
  final String? verificationId;
  final int? token;

  const OnPhoneOtpSent({
    required this.verificationId,
    this.token,
  });
}

/// This event will be triggered when any error occurs while sending the OTP to the user's phone number. This can be due to network issues or firebase's error.
class OnPhoneAuthErrorEvent extends SignInEvent {
  final String error;

  const OnPhoneAuthErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}

/// This event will be triggered when the verification of the OTP is successful.
class OnSignInVerificationCompleteEvent extends SignInEvent {
  final AuthCredential credential;
  final bool autoVerified;

  const OnSignInVerificationCompleteEvent(
      {required this.credential, required this.autoVerified});

  @override
  List<Object?> get props => [credential, autoVerified];
}

class DoLoginAndStoreInformationEvent extends SignInEvent {
  final String phoneNumber;
  final String accessToken;

  const DoLoginAndStoreInformationEvent({
    required this.phoneNumber,
    required this.accessToken,
  });

  @override
  List<Object?> get props => [phoneNumber, accessToken];
}
