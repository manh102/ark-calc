import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:arklevelcalculator/localization/app_translations.dart';
import 'package:arklevelcalculator/resources/app_color.dart';

class UiUtil {
  static Widget buildLine() {
    return Container(
      width: double.infinity,
      height: 0.2,
      color: AppColor.lineGayColor,
    );
  }

  static String getStringFromRes(String key, BuildContext context) =>
      AppTranslations.of(context).text(key);

  static getStatusBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static Widget buildSessionText(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.black,
          fontSize: 16,
        ),
      ),
    );
  }

  static void showToastMsg(String msg, {bool isErrorMsg = false}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: isErrorMsg ? Colors.red : AppColor.searchBoxTextColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
