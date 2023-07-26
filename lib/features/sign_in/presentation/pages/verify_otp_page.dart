import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:new_ark_calc/core/extensions/string_extension.dart';
import 'package:new_ark_calc/core/navigation/app_routes.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/util/core_util.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';
import 'package:new_ark_calc/core/widgets/dialog/dialog.dart';
import 'package:new_ark_calc/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:new_ark_calc/features/sign_in/presentation/bloc/sign_in_state.dart';
import 'package:new_ark_calc/features/sign_in/presentation/widgets/sign_in_widgets_mixin.dart';

import '../bloc/sign_in_event.dart';

class VerifyOtpPage extends StatefulWidget {
  final String phoneNumber;

  const VerifyOtpPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> with SignInWidgetsMixin {
  late SignInBloc signInBloc;
  final TextEditingController otpController = TextEditingController();
  final focusNode = FocusNode();
  bool showError = false;
  static const otpLength = 6;

  @override
  void initState() {
    signInBloc = context.read<SignInBloc>();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    signInBloc.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) async {
        if (state is SignInPhoneAuthVerified) {
          GoRouter.of(context).goNamed(AppRoutes.homeTab.namedRoute,
              extra: {"isLoggedIn": true});
        }

        if (state is SignInError) {
          await PSDialog.instance.showErrorDialog(
              context: context,
              messageCode: state.messageCode,
              messageContent: state.messageContent);
        }
      },
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<SignInBloc, SignInState>(
      bloc: signInBloc,
      builder: (context, state) {
        if (state is SignInLoading) {
          EasyLoading.show();
        }

        if (EasyLoading.isShow && !(state is SignInError)) {
          EasyLoading.dismiss();
        }

        if (state is SignInOtpCodeSentSuccess) {
          EasyLoading.showSuccess("Resent OTP",
              maskType: EasyLoadingMaskType.black);
        }

        return buildBodyContainer([
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                PSSpacing.horizontalMargin,
                PSSpacing.horizontalMargin,
                PSSpacing.horizontalMargin,
                0.0,
              ),
              child: ListView(
                children: [
                  buildTitle("VERIFY_OTP_TITLE".tr()),
                  gapH16,
                  buildSubTitle("VERIFY_OTP_SUBTITLE".tr(), padding: 70),
                  gapH32,
                  _buildOtpInput(),
                  gapH16,
                  _buildResendCode(),
                ],
              ),
            ),
          ),
          buildBottomButton(
              label: "VERIFY_OTP_LOGIN_BUTTON".tr(),
              onPressed: () {
                _verifyOtp(otp: otpController.text);
              })
        ]);
      },
    );
  }

  Widget _buildOtpInput() {
    final defaultPinTheme = PinTheme(
      width: PSSpacing.pinPutHeight,
      height: PSSpacing.pinPutHeight,
      textStyle: PSStyle.t24R,
      decoration: BoxDecoration(
        color: SoloerColors.pinPutFill,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.transparent, width: 0.5),
      ),
    );

    return SizedBox(
      height: PSSpacing.pinPutHeight,
      child: Pinput(
        length: otpLength,
        controller: otpController,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          _verifyOtp(otp: pin);
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: SoloerColors.pinPutBorder),
              color: SoloerColors.background),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: SoloerColors.pinPutError,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }

  Widget _buildResendCode() {
    Widget _buildTitle() {
      return PSText.sectionSubTitle("VERIFY_OTP_DID_NOT_RECEIVE_CODE".tr(),
          color: Color(0xFF7E7E7E),
          textStyle: PSStyle.t14B.copyWith(
            height: 1.6,
          ),
          fontWeight: FontWeight.w400);
    }

    Widget _buildAction(String actionLabel, {Function()? onTap}) {
      return GestureDetector(
        onTap: onTap,
        child: PSText.sectionSubTitle(actionLabel,
            color: Color(0xFFAB87FF),
            textStyle: PSStyle.t14B
                .copyWith(height: 1.6, decoration: TextDecoration.underline),
            fontWeight: FontWeight.w400),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTitle(),
        gapH4,
        _buildAction(
          "VERIFY_OTP_RESEND_OTP".tr(),
          onTap: () {
            Logging.log.info("Resent Code");
            signInBloc.add(SendOtpToPhoneEvent(
                phoneNumber: widget.phoneNumber, shouldAwaitCodeSend: false));
          },
        ),
      ],
    );
  }

  void _verifyOtp({required String otp}) {
    if (otp.length != otpLength) {
      "Please enter an correct OTP code".showSnackBar();
      return;
    }
    signInBloc.add(VerifySentOtpEvent(
        otpCode: otpController.text,
        verificationId: signInBloc.verificationId!));
  }
}
