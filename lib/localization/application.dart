import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:arklevelcalculator/base/di/locator.dart';
import 'package:arklevelcalculator/localization/app_translations_delegate.dart';

const VN_CODE = 'vi';
const EN_CODE = 'en';

class Application {
  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }

  Application._internal();

  GlobalKey<NavigatorState> _navigatorKey;

  final List<String> supportedLanguages = [
    "English",
    "Vietnamese",
  ];

  final List<String> supportedLanguagesCodes = [
    EN_CODE,
    VN_CODE,
  ];

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  //function to be invoked when changing the language
  LocaleChangeCallback onLocaleChanged;

  GlobalKey<NavigatorState> getNavigatorKey({
    bool isGenNewKey = false,
  }) {
    if (isGenNewKey) {
      _navigatorKey = GlobalKey<NavigatorState>();
    }
    return _navigatorKey;
  }

  BuildContext getCurrentContext() => _navigatorKey.currentState.context;
}

Application application = Application();
AppTranslationsDelegate newLocaleDelegate;
String langCode;

typedef void LocaleChangeCallback(Locale locale);

Future<void> initLangCode() async {
  langCode = VN_CODE;
}
