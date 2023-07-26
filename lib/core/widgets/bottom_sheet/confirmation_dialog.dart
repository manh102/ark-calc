import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/extensions/string_extension.dart';
import 'package:new_ark_calc/core/widgets/common/buttons/outlined_button.dart';
import 'package:new_ark_calc/core/widgets/common_typedef.dart';

import '../../resources/text_styles.dart';
import '../common/buttons/filled_button.dart';
import '../common/text_widget.dart';

class PSConfirmationDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final String positiveContent;
  final String negativeContent;
  final OnPositiveButtonTapped onPositiveButtonTapped;
  final OnNegativeButtonTapped onNegativeButtonTapped;

  const PSConfirmationDialogWidget(
      {Key? key,
      required this.title,
      required this.content,
      required this.positiveContent,
      required this.negativeContent,
      required this.onPositiveButtonTapped,
      required this.onNegativeButtonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitle(),
        Visibility(
            visible: !content.isNullOrBlank(),
            child: Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: _buildContent(),
            )),
        48.verticalSpace,
        _buildPositiveButton(),
        12.verticalSpace,
        _buildNegativeButton(),
      ],
    );
  }

  Widget _buildTitle() {
    return PSText.bottomSheetTitle(title);
  }

  Widget _buildContent() {
    return PSText.normalText(
      content,
      textStyle: PSStyle.t14L.copyWith(height: 1.6),
      textAlign: TextAlign.left,
    );
  }

  Widget _buildPositiveButton() => Container(
        width: 1.sw,
        child: PSFilledButton.normal(
          label: positiveContent,
          onPressed: onPositiveButtonTapped,
        ),
      );

  Widget _buildNegativeButton() => Container(
        width: 1.sw,
        child: PSOutlinedButton.normal(
          label: negativeContent,
          onPressed: onNegativeButtonTapped,
        ),
      );
}

class ConfirmationDialogData {
  final String title;
  final String content;
  final String positiveContent;
  final String negativeContent;
  final OnPositiveButtonTapped onPositiveButtonTapped;
  final OnNegativeButtonTapped onNegativeButtonTapped;

  const ConfirmationDialogData({
    required this.title,
    required this.content,
    required this.positiveContent,
    required this.negativeContent,
    required this.onPositiveButtonTapped,
    required this.onNegativeButtonTapped,
  });
}
