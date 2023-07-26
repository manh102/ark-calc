import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';

/// =========Use===========
///
/// Ex: PSStyle.t14R
///
/// use copyWith()
///
/// return a new object with the same properties as the original, but with the values you specify
class PSStyle {
  static const String _fontName = 'Alexandria';

  static TextStyle t6R = getStyleNormal(6.sp);
  static TextStyle t6B = getStyleBold(6.sp);
  static TextStyle t6L = getStyleLight(6.sp);
  static TextStyle t8R = getStyleNormal(8.sp);
  static TextStyle t8B = getStyleBold(8.sp);
  static TextStyle t8L = getStyleLight(9.sp);
  static TextStyle t9R = getStyleNormal(9.sp);
  static TextStyle t9B = getStyleBold(9.sp);
  static TextStyle t9L = getStyleLight(9.sp);
  static TextStyle t10R = getStyleNormal(10.sp);
  static TextStyle t10B = getStyleBold(10.sp);
  static TextStyle t10L = getStyleLight(10.sp);
  static TextStyle t11R = getStyleNormal(11.sp);
  static TextStyle t11B = getStyleBold(11.sp);
  static TextStyle t11L = getStyleLight(11.sp);
  static TextStyle t12R = getStyleNormal(12.sp);
  static TextStyle t12B = getStyleBold(12.sp);
  static TextStyle t12L = getStyleLight(12.sp);
  static TextStyle t13R = getStyleNormal(13.sp);
  static TextStyle t13B = getStyleBold(13.sp);
  static TextStyle t13L = getStyleLight(13.sp);
  static TextStyle t14R = getStyleNormal(14.sp);
  static TextStyle t14B = getStyleBold(14.sp);
  static TextStyle t14L = getStyleLight(14.sp);
  static TextStyle t15R = getStyleNormal(15.sp);
  static TextStyle t15B = getStyleBold(15.sp);
  static TextStyle t15L = getStyleLight(6.sp);
  static TextStyle t16R = getStyleNormal(16.sp);
  static TextStyle t16B = getStyleBold(16.sp);
  static TextStyle t16L = getStyleLight(16.sp);
  static TextStyle t17R = getStyleNormal(17.sp);
  static TextStyle t17B = getStyleBold(17.sp);
  static TextStyle t17L = getStyleLight(17.sp);
  static TextStyle t18R = getStyleNormal(18.sp);
  static TextStyle t18B = getStyleBold(18.sp);
  static TextStyle t18L = getStyleLight(18.sp);
  static TextStyle t20R = getStyleNormal(20.sp);
  static TextStyle t20B = getStyleBold(20.sp);
  static TextStyle t20L = getStyleLight(20.sp);
  static TextStyle t24R = getStyleNormal(24.sp);
  static TextStyle t24B = getStyleBold(24.sp);
  static TextStyle t24L = getStyleLight(24.sp);
  static TextStyle t25R = getStyleNormal(25.sp);
  static TextStyle t25B = getStyleBold(25.sp);
  static TextStyle t25L = getStyleLight(25.sp);
  static TextStyle t30R = getStyleNormal(30.sp);
  static TextStyle t30B = getStyleBold(30.sp);
  static TextStyle t30L = getStyleLight(30.sp);
  static TextStyle t32R = getStyleNormal(32.sp);
  static TextStyle t32B = getStyleBold(32.sp);
  static TextStyle t32L = getStyleLight(32.sp);

  static TextStyle getStyleNormal(double inSize) {
    return TextStyle(
        fontSize: inSize,
        fontWeight: FontWeight.normal,
        color: SoloerColors.primary,
        fontFamily: _fontName,
        overflow: TextOverflow.visible);
  }

  static TextStyle getStyleBold(double inSize) {
    return TextStyle(
        fontSize: inSize,
        fontWeight: FontWeight.w600,
        color: SoloerColors.primary,
        fontFamily: _fontName,
        overflow: TextOverflow.visible);
  }

  static TextStyle getStyleLight(double inSize) {
    return TextStyle(
        fontSize: inSize,
        fontWeight: FontWeight.w300,
        color: SoloerColors.primary,
        fontFamily: _fontName,
        overflow: TextOverflow.visible);
  }

  // Recruit Page
  static TextStyle kRecruitTitle = TextStyle(
    fontSize: 15.0,
    color: Color(0xFF8D8E98),
  );
}
