import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';

class PSOutlinedButton extends OutlinedButton {
  PSOutlinedButton({
    required super.onPressed,
    required super.child,
    super.style,
  });

  factory PSOutlinedButton.normal({
    required String label,
    required void Function()? onPressed,
  }) {
    return PSOutlinedButton(
      onPressed: onPressed,
      child: DefaultTextStyle(
          style:
              PSStyle.t14R.copyWith(color: SoloerColors.primary, height: 1.6),
          child: Text(label)),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 9.h),
        shape: const StadiumBorder(),
        side: BorderSide(width: 1.w, color: SoloerColors.primary),
      ),
    );
  }
}
