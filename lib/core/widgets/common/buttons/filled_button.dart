import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/widgets/widgets.dart';

class PSFilledButton extends FilledButton {
  PSFilledButton({required super.onPressed, required super.child, super.style});

  factory PSFilledButton.normal({
    required String label,
    required void Function()? onPressed,
  }) {
    return PSFilledButton(
      onPressed: onPressed,
      child: PSText.button(label),
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 9.h),
        shape: StadiumBorder(),
      ),
    );
  }

  factory PSFilledButton.normalContrast({
    required String label,
    required void Function()? onPressed,
  }) {
    return PSFilledButton(
      onPressed: onPressed,
      child: DefaultTextStyle(
        style: PSStyle.t14R.copyWith(color: SoloerColors.primary, height: 1.6),
        child: Text(label),
      ),
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 9.h),
        shape: StadiumBorder(),
        backgroundColor: SoloerColors.background,
      ),
    );
  }

  factory PSFilledButton.disabled({
    required String label,
  }) {
    return PSFilledButton(
      onPressed: null,
      child: DefaultTextStyle(
        style: PSStyle.t14R.copyWith(
          color: SoloerColors.buttonDisabledText,
        ),
        child: Text(label),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
        backgroundColor: MaterialStateProperty.all<Color>(
            SoloerColors.buttonDisabledBackground),
      ),
    );
  }
}
