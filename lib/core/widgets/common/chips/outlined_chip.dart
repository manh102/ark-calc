import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';

import '../text_widget.dart';

class PSOutlinedChip extends StatelessWidget {
  final String label;
  final Color borderColor;
  final double? borderRadius;
  final Color labelColor;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  final Function()? onTapped;

  const PSOutlinedChip(
      {Key? key,
      required this.label,
      this.borderRadius,
      this.borderColor = SoloerColors.primary,
      this.labelColor = SoloerColors.primary,
      this.labelStyle,
      this.padding,
      this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Material(
        color: Colors.transparent,
        shape: _buildCustomShape(),
        child: InkWell(
          onTap: onTapped,
          customBorder: _buildCustomShape(),
          child: Container(
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: Colors.transparent,
              shape: borderRadius != null
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius!))
                  : StadiumBorder(),
            ),
            padding: padding ?? PSSpacing.outlinedChipPadding,
            child: PSText.chip(
              label,
              fontSize: labelStyle?.fontSize ?? 12.sp,
              color: labelStyle?.color ?? labelColor,
              textStyle: labelStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  ShapeBorder _buildCustomShape() => borderRadius != null
      ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          side: BorderSide(color: borderColor))
      : StadiumBorder(side: BorderSide(color: borderColor));
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
