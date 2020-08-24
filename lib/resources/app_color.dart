import 'package:flutter/material.dart';

class AppColor {
  // Define color.
  static var black = HexColor("#000000");
  static var white = HexColor("#FFFFFF");
  static var whiteOpacity = HexColor("#A6FFFFFF");
  static var blackOpacity = HexColor("#A6000000");
  static var mainColor = HexColor("#F43C5A");
  static var greenButtonColor = HexColor("#A5BE40");
  static var grayButtonColor = HexColor("#B8B8B8");
  static var inputGrayColor = HexColor("#707070");
  static var facebookColor = HexColor("#3B5998");
  static var errorColor = HexColor("#BF2928");
  static var successColor = HexColor("#67CB4F");
  static var confirmColor = HexColor("#C9A100");
  static var tabActiveColor = HexColor("#E30000");
  static var tabInActiveColor = HexColor("#000000");
  static var lineGayColor = HexColor("#707070");
  static var memberShipColorGreen = HexColor("#D1C300");

  static var priceColor = HexColor("#E21414");
  static var pinkTextColor = HexColor("#F9C5CC");
  static var searchBoxColor = HexColor("#268E8E93");
  static var searchBoxTextColor = HexColor("#8E8E93");
  static var greyBackground = HexColor("#E1E1E1");
  static var iconColor = HexColor("#9E9E9E");
  static var headerLineTextColor = HexColor("#616161");
  static var titleTextColor = HexColor("#616161");
  static var subheadTextColor = HexColor("#9E9E9E");
  static var captionTextColor = HexColor("#9E9E9E");
  static var subtitleTextColor = HexColor("#616161");
  static var lineColor = HexColor("#E0E0E0");
  static var greyIconBackground = HexColor("#C9C9C9");
  static var appScreenBackground = HexColor("#F2F3F3");
  static var green = HexColor('#009C80');
  static var purple = HexColor('#2B08B9');
  static var grayOp50 = HexColor('#f5f5f5');

  // Define Vigor color
  static var redVigor = HexColor('#ED1C24');
  static var greenVigor = HexColor('#A6CE39');
  static var orangeVigor = HexColor('#FDB913');
  static var grayVigor = HexColor('#D5D6D1');
  static var grayTextfieldVigor = HexColor('#CECFD0');
  static var grayProfileIcon = HexColor('#EBEBEB');
  static var blueFacebook = HexColor('#3A5A94');
  static var avaContainerColor = HexColor('#FAFAFA');
  static var avaContainerBorderColor = HexColor('#D6D6D6');
}

// Parse hex to color.
class HexColor extends Color {
  static int _getColorFromHex(hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(value) : super(_getColorFromHex(value));
}
