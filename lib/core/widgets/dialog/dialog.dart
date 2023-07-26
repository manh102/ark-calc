import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ark_calc/core/extensions/context_extension.dart';
import 'package:new_ark_calc/core/extensions/string_extension.dart';
import 'package:new_ark_calc/core/resources/colors.dart';
import 'package:new_ark_calc/core/widgets/common_typedef.dart';

import '../../resources/text_styles.dart';
import '../common/buttons/filled_button.dart';
import '../common/buttons/outlined_button.dart';
import '../common/text_widget.dart';

class PSActionButton {
  final String label;
  final void Function() onTap;

  const PSActionButton({
    required this.label,
    required this.onTap,
  });
}

class PSDialog {
  static final PSDialog instance = PSDialog._internal();

  factory PSDialog() {
    return instance;
  }

  PSDialog._internal();

  bool isShowingDialog = false;

  Future<void> showAlertDialog(BuildContext context,
      {required String title,
      required String? content,
      required PSActionButton positiveButton,
      PSActionButton? negativeButton,
      bool mustCloseAllDialogs = false}) async {
    if (mustCloseAllDialogs && isShowingDialog) {
      return;
    }

    Widget _buildTitle(String title) {
      return PSText.bottomSheetTitle(title);
    }

    Widget _buildContent(String content) {
      return SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            PSText.normalText(
              content,
              textStyle: PSStyle.t14L.copyWith(height: 1.6),
              textAlign: TextAlign.left,
            )
          ],
        ),
      );
    }

    Widget _buildPositiveButton(String positiveButtonText,
            OnPositiveButtonTapped onPositiveButtonTapped) =>
        PSFilledButton.normal(
          label: positiveButtonText,
          onPressed: onPositiveButtonTapped,
        );

    Widget _buildNegativeButton(String negativeButtonText,
            OnNegativeButtonTapped onNegativeButtonTapped) =>
        PSOutlinedButton.normal(
          label: negativeButtonText,
          onPressed: onNegativeButtonTapped,
        );

    isShowingDialog = true;
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: _buildTitle(title),
          content: !content.isNullOrBlank() ? _buildContent(content!) : null,
          actions: <Widget>[
            negativeButton != null
                ? _buildNegativeButton(
                    negativeButton.label,
                    () {
                      negativeButton.onTap.call();
                      isShowingDialog = false;
                    },
                  )
                : SizedBox.shrink(),
            _buildPositiveButton(positiveButton.label, () {
              positiveButton.onTap.call();
              isShowingDialog = false;
            }),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0.r),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          actionsPadding:
              EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          elevation: 1.0,
          shadowColor: SoloerColors.primary,
        );
      },
    );
  }

  Future<void> showTimeOutDialog(BuildContext context,
      {OnPositiveButtonTapped? onPositiveButtonTapped}) {
    return showAlertDialog(context,
        title: "Session Timeout",
        content:
            "Your session has timed out due to inactivity. Please log in again to continue using the application.",
        positiveButton: PSActionButton(
          label: "Login",
          onTap: () async {
            onPositiveButtonTapped?.call();
            await context.backToSignIn(forceResetSession: true);
          },
        ),
        negativeButton: PSActionButton(
          label: "Close",
          onTap: () {
            context.pop();
          },
        ),
        mustCloseAllDialogs: true);
  }

  Future<void> showErrorDialog({
    required BuildContext context,
    String? messageCode,
    required String messageContent,
    OnPositiveButtonTapped? onPositiveButtonTapped,
  }) {
    return showAlertDialog(
      context,
      title: "Error ${!messageCode.isNullOrBlank() ? "($messageCode)" : ""}",
      content: "$messageContent. Please try again later.",
      positiveButton: PSActionButton(
        label: "OK",
        onTap: () async {
          context.pop();
          onPositiveButtonTapped?.call();
        },
      ),
      mustCloseAllDialogs: true,
    );
  }
}
