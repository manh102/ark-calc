import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:new_ark_calc/core/config/common.dart';
import 'package:new_ark_calc/core/network/result_entity.dart';
import 'package:new_ark_calc/core/network/task_type.dart';
import 'package:new_ark_calc/core/util/core_util.dart';
import 'package:new_ark_calc/core/util/error_code.dart';

import 'interceptors/refresh_interceptor.dart';

class BaseDio {
  final Dio dio;

  BaseDio(this.dio) {
    if (!Common.isTestingMode) {
      dio.interceptors.add(RefreshTokenInterceptor(this));
    }
  }

  Future<ResultEntity<T>> request<T>(String url, MethodType method,
      {Map<String, String>? headers, dynamic data}) {
    switch (method) {
      case MethodType.POST:
        return post<T>(url, headers: headers, data: data);
      case MethodType.PUT:
        return put<T>(url, headers: headers, data: data);
      case MethodType.DELETE:
        return delete<T>(url, headers: headers, data: data);
      default:
        // GET METHOD
        return get<T>(url, headers: headers, data: data);
    }
  }

  Future<ResultEntity<T>> get<T>(String url,
      {Map<String, String>? headers, Map<String, dynamic>? data}) async {
    try {
      headers ??= <String, String>{};
      headers.addAll({
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json'
      });

      var response = await dio.request(url,
          queryParameters: data,
          options: Options(headers: headers, method: 'GET'));

      return ResultEntity<T>(TaskResult.success, response.data);
    } catch (exception, stackTrace) {
      Logging.log.error("Error", exception, stackTrace);
      if (exception is DioError &&
          exception.error == "Http status error [401]") {
        return ResultEntity<T>(
            TaskResult.tokenTimeout, exception.response?.data);
      }
      if (exception is DioError) {
        return ResultEntity<T>(TaskResult.error, exception.response?.data);
      }
      return ResultEntity<T>(TaskResult.error,
          {'code': ErrorCode.MA013CE, 'message': ErrorCode.MA013CE.tr()});
    }
  }

  Future<ResultEntity<T>> post<T>(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      headers ??= <String, String>{};
      headers.addAll({
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json'
      });
      var response = await dio.request(url,
          queryParameters: queryParameters,
          data: data,
          options: Options(headers: headers, method: 'POST'));

      return ResultEntity(TaskResult.success, response.data);
    } catch (exception, stackTrace) {
      Logging.log.error("Error", exception, stackTrace);
      if (exception is DioError &&
          exception.error == "Http status error [401]") {
        return ResultEntity(TaskResult.tokenTimeout, exception.response?.data);
      }
      if (exception is DioError) {
        return ResultEntity(TaskResult.error, exception.response?.data);
      }
      return ResultEntity(TaskResult.error,
          {'code': ErrorCode.MA013CE, 'message': ErrorCode.MA013CE.tr()});
    }
  }

  Future<ResultEntity<T>> uploadFile<T>(
    String url, {
    required Map<String, dynamic> param,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var formData = FormData.fromMap(param);
      var response = await dio.post(
        url,
        data: formData,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return ResultEntity(TaskResult.success, response.data);
    } catch (exception, stackTrace) {
      Logging.log.error("Error", exception, stackTrace);
      if (exception is DioError &&
          exception.error == "Http status error [401]") {
        return ResultEntity(TaskResult.tokenTimeout, exception.response?.data);
      }
      if (exception is DioError) {
        return ResultEntity(TaskResult.error, exception.response?.data);
      }
      return ResultEntity(TaskResult.error,
          {'code': ErrorCode.MA013CE, 'message': ErrorCode.MA013CE.tr()});
    }
  }

  Future<ResultEntity<T>> put<T>(String url,
      {Map<String, String>? headers,
      required Map<String, dynamic> data}) async {
    try {
      headers ??= <String, String>{};
      headers.addAll({
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json'
      });
      var response = await dio.request(url,
          data: data, options: Options(headers: headers, method: 'PUT'));

      return ResultEntity(TaskResult.success, response.data);
    } catch (exception, stackTrace) {
      Logging.log.error("Error", exception, stackTrace);
      if (exception is DioError &&
          exception.error == "Http status error [401]") {
        return ResultEntity(TaskResult.tokenTimeout, exception.response?.data);
      }
      if (exception is DioError) {
        return ResultEntity(TaskResult.error, exception.response?.data);
      }
      return ResultEntity(TaskResult.error,
          {'code': ErrorCode.MA013CE, 'message': ErrorCode.MA013CE.tr()});
    }
  }

  Future<ResultEntity<T>> delete<T>(String url,
      {Map<String, String>? headers,
      required Map<String, dynamic> data}) async {
    try {
      headers ??= <String, String>{};
      headers.addAll({
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json'
      });
      var response = await dio.request(url,
          data: data, options: Options(headers: headers, method: 'DELETE'));

      return ResultEntity(TaskResult.success, response.data);
    } catch (exception, stackTrace) {
      Logging.log.error("Error", exception, stackTrace);
      if (exception is DioError &&
          exception.error == "Http status error [401]") {
        return ResultEntity(TaskResult.tokenTimeout, exception.response?.data);
      }
      if (exception is DioError) {
        return ResultEntity(TaskResult.error, exception.response?.data);
      }
      return ResultEntity(TaskResult.error,
          {'code': ErrorCode.MA013CE, 'message': ErrorCode.MA013CE.tr()});
    }
  }
}
