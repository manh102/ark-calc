import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:new_ark_calc/core/secure_storage/user_secure_storage.dart';

class HelperFunction {
  static final HelperFunction instance = HelperFunction._internal();

  static final psFullDateFormat = "d MMM y, hh:mm a";

  factory HelperFunction() {
    return instance;
  }

  HelperFunction._internal() {
    // Implement code
  }

  Future saveJwt(String accessToken, String refreshToken) async {
    await UserSecureStorage.instance.setAccessToken(accessToken);
    await UserSecureStorage.instance.setRefreshToken(refreshToken);
  }

  Future removeJwt() async {
    await UserSecureStorage.instance.deleteAccessToken();
    await UserSecureStorage.instance.deleteRefreshToken();
  }

  // Save Token
  Future saveToken(String accessToken, String refreshToken) async {
    await UserSecureStorage.instance.setAccessToken(accessToken);
    await UserSecureStorage.instance.setRefreshToken(refreshToken);
  }

  String formatBeanPoint(int beans) {
    return NumberFormat("#,###").format(beans).replaceAll(".", ",");
  }

  String formattedDateTime(DateTime? dateTime, {String? dateFormat}) {
    if (dateTime == null) return "";
    return DateFormat(dateFormat ?? psFullDateFormat).format(dateTime);
  }

  // Copy text to clipboard
  Future<void> copyToClipboard(String text) async {
    return Clipboard.setData(ClipboardData(text: text));
  }
}
