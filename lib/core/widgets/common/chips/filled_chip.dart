import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';

import '../text_widget.dart';

class PSFilledChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final double? fontSize;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  final Function()? onTapped;

  const PSFilledChip(
      {Key? key,
      required this.label,
      this.backgroundColor = SoloerColors.chipBackground,
      this.labelColor = SoloerColors.primary,
      this.padding,
      this.onTapped,
      this.labelStyle,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Material(
        color: backgroundColor,
        shape: _buildCustomShape(),
        child: InkWell(
          onTap: onTapped,
          customBorder: _buildCustomShape(),
          child: Container(
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: Colors.transparent,
              shape: StadiumBorder(),
            ),
            padding: padding ?? PSSpacing.chipPadding,
            child: PSText.chip(
              label,
              fontSize: fontSize ?? 12.sp,
              color: labelColor,
              textAlign: TextAlign.center,
              textStyle: labelStyle,
            ),
          ),
        ),
      ),
    );
  }

  ShapeBorder _buildCustomShape() => StadiumBorder();
}

class PSChipStyle {
  final Color backgroundColor;
  final Color labelColor;

  const PSChipStyle({
    required this.backgroundColor,
    required this.labelColor,
  });

  factory PSChipStyle.unselected() {
    return PSChipStyle(
        backgroundColor: SoloerColors.chipBackground,
        labelColor: SoloerColors.primary);
  }

  factory PSChipStyle.selected() {
    return PSChipStyle(
        backgroundColor: SoloerColors.primary,
        labelColor: SoloerColors.chipBackground);
  }
}
