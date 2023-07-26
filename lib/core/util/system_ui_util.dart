import 'package:flutter/services.dart';

import '../navigation/app_routes.dart';
import '../resources/colors.dart';
import '../widgets/common/top_app_bar/top_app_bar_widget.dart';

class SystemUiUtils {
  static final SystemUiUtils instance = SystemUiUtils._internal();

  factory SystemUiUtils() {
    return instance;
  }

  SystemUiUtils._internal();

  void setupSystemUiStyle({bool isTransparentAppBar = false}) {
    if (isTransparentAppBar) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: SoloerColors.transparentStatusBarColor,
            statusBarIconBrightness: Brightness.dark),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: SoloerColors.normalStatusBarColor,
            statusBarIconBrightness: Brightness.dark),
      );
    }
  }

  void onChangeSystemUiStylePerRoute(String location) {
    final currentRoute = AppRoutes.getRoute(
        (value) => value.namedRoute == location.substring(1));

    bool isTransparentTopAppBar =
        currentRoute?.topAppBarStyle == PSTopAppBarStyle.transparent;

    setupSystemUiStyle(isTransparentAppBar: isTransparentTopAppBar);
  }

  SystemUiOverlayStyle getSystemUiStyle({bool isTransparentAppBar = false}) {
    if (isTransparentAppBar) {
      return SystemUiOverlayStyle(
          statusBarColor: SoloerColors.transparentStatusBarColor,
          statusBarIconBrightness: Brightness.dark);
    } else {
      return SystemUiOverlayStyle(
          statusBarColor: SoloerColors.normalStatusBarColor,
          statusBarIconBrightness: Brightness.dark);
    }
  }
}
