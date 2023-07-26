import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors.dart';
import '../../resources/text_styles.dart';

class PSText extends Text {
  PSText.text(String data,
      {super.key,
      bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      int? maxLines})
      : super(
          data,
          style: textStyle ?? PSStyle.t25B,
          softWrap: softWrap,
          overflow: textOverflow,
          textAlign: textAlign,
          maxLines: maxLines,
        );

  factory PSText.header(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      int? maxLines,
      Color? color,
      double? fontSize}) {
    return PSText.text(
      data,
      textStyle: PSStyle.t25B.copyWith(fontSize: fontSize, color: color),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.topAppBarTitle(String data) {
    return PSText.text(
      data,
      textStyle: PSStyle.t18B.copyWith(
          color: SoloerColors.primaryText,
          height: 1.6,
          fontWeight: FontWeight.w600),
      maxLines: 1,
      textOverflow: TextOverflow.visible,
      textAlign: TextAlign.start,
      softWrap: true,
    );
  }

  factory PSText.subtitle(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      double? fontSize,
      Color? color,
      int? maxLines}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
            fontSize: fontSize,
            color: color ?? SoloerColors.subText,
          ) ??
          PSStyle.t12B.copyWith(
            fontSize: fontSize,
            color: color ?? SoloerColors.subText,
          ),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.regular(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      double? fontSize,
      Color? color,
      int? maxLines}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
              fontSize: fontSize, color: SoloerColors.primaryText) ??
          PSStyle.t25R
              .copyWith(fontSize: fontSize, color: SoloerColors.primaryText),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.button(
    String data, {
    TextStyle? textStyle,
    double? fontSize,
    Color? color,
  }) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
              fontSize: fontSize,
              color: color ?? SoloerColors.onInverseSurface,
              height: 1.6) ??
          PSStyle.t14R.copyWith(
              fontSize: fontSize,
              color: color ?? SoloerColors.onInverseSurface,
              height: 1.6),
    );
  }

  factory PSText.bottomNavItemTitle(
    String data, {
    TextStyle? textStyle,
    double? fontSize,
    Color? color,
  }) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
              fontSize: fontSize ?? 11.sp,
              color: color ?? SoloerColors.selectedTabColor,
              fontWeight: FontWeight.w400,
              height: 1.6) ??
          PSStyle.t10L.copyWith(
              fontSize: fontSize ?? 11.sp,
              color: color ?? SoloerColors.selectedTabColor,
              fontWeight: FontWeight.w400,
              height: 1.6),
    );
  }

  factory PSText.cardTitle(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      double fontSize = 14,
      Color? color = SoloerColors.primaryText,
      int? maxLines,
      FontWeight? fontWeight}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
              fontSize: fontSize.sp,
              color: color,
              height: 1.6,
              fontWeight: fontWeight) ??
          PSStyle.t14B
              .copyWith(color: color, height: 1.6, fontWeight: fontWeight),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.cardSubtitle(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.ellipsis,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      double? fontSize,
      Color? color,
      int? maxLines}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
              fontSize: fontSize,
              color: SoloerColors.primaryText,
              height: 1.6,
              fontWeight: FontWeight.w300) ??
          PSStyle.t12L.copyWith(
              fontSize: fontSize,
              color: SoloerColors.primaryText,
              height: 1.6,
              fontWeight: FontWeight.w300),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.chip(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      double? fontSize,
      Color? color,
      int? maxLines}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
            fontSize: fontSize,
            color: color ?? SoloerColors.primary,
          ) ??
          PSStyle.t8R.copyWith(
            fontSize: fontSize,
            color: color ?? SoloerColors.primary,
          ),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.dataTableLabel(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      double? fontSize,
      Color? color,
      int? maxLines}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
            fontSize: fontSize,
            color: SoloerColors.primaryText,
          ) ??
          PSStyle.t12B
              .copyWith(fontSize: fontSize, color: SoloerColors.primaryText),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.dataTableValue(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      double? fontSize,
      Color? color,
      int? maxLines}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
            fontSize: fontSize,
            color: color ?? SoloerColors.primaryText,
          ) ??
          PSStyle.t12L.copyWith(
              fontSize: fontSize, color: color ?? SoloerColors.primaryText),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.sectionTitle(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      int? maxLines,
      Color? color,
      double? fontSize}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
            fontSize: fontSize,
            color: color ?? SoloerColors.primaryText,
          ) ??
          PSStyle.t14R.copyWith(
              fontSize: fontSize, color: color ?? SoloerColors.primaryText),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.detailTitle(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      int? maxLines,
      Color? color,
      double? fontSize}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
            fontSize: fontSize,
            color: color ?? SoloerColors.primaryText,
          ) ??
          PSStyle.t16R.copyWith(
              fontSize: fontSize, color: color ?? SoloerColors.primaryText),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.normalText(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      int? maxLines,
      Color? color = SoloerColors.primaryText,
      double? fontSize}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
            color: color,
          ) ??
          PSStyle.t12L.copyWith(
            fontSize: fontSize,
            color: color,
          ),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.sectionSubTitle(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      int? maxLines,
      Color? color = SoloerColors.primaryText,
      double? fontSize,
      FontWeight? fontWeight = FontWeight.w300}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
              fontSize: fontSize,
              color: color ?? SoloerColors.primaryText,
              fontWeight: FontWeight.w300) ??
          PSStyle.t12R.copyWith(
              fontSize: fontSize,
              color: color ?? SoloerColors.primaryText,
              fontWeight: FontWeight.w300),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.cardBigTitle(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      int? maxLines,
      Color? color = SoloerColors.primaryText,
      double? fontSize}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
              fontSize: fontSize, color: color, height: 1.6) ??
          PSStyle.t16B.copyWith(fontSize: fontSize, color: color, height: 1.6),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.cardSmallTitle(String data,
      {bool softWrap = true,
      TextOverflow textOverflow = TextOverflow.visible,
      TextAlign textAlign = TextAlign.start,
      TextStyle? textStyle,
      int? maxLines,
      Color? color = SoloerColors.grey4,
      double? fontSize}) {
    return PSText.text(
      data,
      textStyle: textStyle?.copyWith(
              fontSize: fontSize,
              color: color,
              height: 1.6,
              fontWeight: FontWeight.w400) ??
          PSStyle.t9B.copyWith(
              fontSize: fontSize,
              color: color,
              height: 1.6,
              fontWeight: FontWeight.w400),
      maxLines: maxLines,
      textOverflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  factory PSText.bottomSheetTitle(String data) {
    return PSText.text(
      data,
      textStyle: PSStyle.t18B.copyWith(height: 1.6),
      textOverflow: TextOverflow.ellipsis,
    );
  }

  factory PSText.checkboxTitle(String data) {
    return PSText.text(
      data,
      textStyle: PSStyle.t14L.copyWith(height: 1.6),
      textOverflow: TextOverflow.ellipsis,
    );
  }
}
