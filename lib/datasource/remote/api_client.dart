import 'dart:io';

import 'package:dio/dio.dart';
import 'package:arklevelcalculator/base/di/locator.dart';
import 'package:arklevelcalculator/datasource/local/shared_preferences_repo.dart';
import 'package:arklevelcalculator/datasource/remote/user_service.dart';
import 'package:arklevelcalculator/logger/app_logger.dart';

class ApiClient {
  final dio = Dio();

  SharedPreferencesRepository _sharedPreferencesRepository =
      locator<SharedPreferencesRepository>();

  //Service

  UserService userService;

  ApiClient() {
    _setUpDio();
    _setUpRetrofitService();
  }

  void _setUpDio() {
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.contentType = 'application/json';
    dio.options.baseUrl =
        'https://arklevelcalculatorhealth.dev.gkcsoftware.com/api/v1';

    dio.interceptors.addAll([
      /// Log
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),

      /// Error
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
        String token = await _sharedPreferencesRepository.getToken();

        AppLogger.d(token);

        options.headers['Authorization'] = 'Bearer $token';
        options.headers['Platform'] = Platform.isIOS ? 'iOS' : 'Android';
        options.headers['App-Version'] = '1.0';

        return options;
      }, onResponse: (Response response) {
        return response;
      }, onError: (DioError e) async {
        bool isLogin = await _sharedPreferencesRepository.getToken() != null;

        if (e.response.statusCode == 401 && isLogin) {
          _sharedPreferencesRepository.clearUserInfo();
//          UiUtil.showToastMsg(
//              UiUtil.getStringFromRes(
//                  AppLang.error_token_expired, application.getCurrentContext()),
//              isErrorMsg: true);
//          LoginScreen.startByNavigatorKey();
        }
        return e; //continue
      }),
    ]);
  }

  void _setUpRetrofitService() {
    userService = UserService(dio, baseUrl: dio.options.baseUrl);
  }
}
