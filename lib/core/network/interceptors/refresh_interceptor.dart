import 'package:dio/dio.dart';
import 'package:new_ark_calc/core/config/common.dart';
import 'package:new_ark_calc/core/secure_storage/user_secure_storage.dart';
import 'package:new_ark_calc/core/util/helper_function.dart';
import '../dio_base.dart';
import '../refresh_model.dart';
import '../task_type.dart';

class RefreshTokenInterceptor extends Interceptor {
  final BaseDio baseDio;

  RefreshTokenInterceptor(this.baseDio);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Check to add token on request
    if (mustHaveToken(options.uri.path.toLowerCase())) {
      var accessToken = await UserSecureStorage.instance.getAccessToken() ?? '';
      if (accessToken != '') {
        options.headers.addAll({
          "Authorization": "Bearer $accessToken",
          "Accept": "application/json"
        });
      }
    }

    // progress continue
    return handler.next(options);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    var response = err.response;

    if (response!.statusCode == 401) {
      var json = response.data as Map<String, dynamic>?;
      if (json != null && json.containsKey('code')) {
        String messageCode = json['code'];
        if (messageCode.contains("401")) {
          var resultData = callRefresh(response);
          if (resultData == null) {
            // Refresh OK
            return handler.resolve(await baseDio.dio.request(
                response.requestOptions.path,
                cancelToken: response.requestOptions.cancelToken,
                data: response.requestOptions.data,
                onReceiveProgress: response.requestOptions.onReceiveProgress,
                onSendProgress: response.requestOptions.onSendProgress,
                options: Options(method: response.requestOptions.method)));
          } else {
            // Refresh expired
            return handler.reject(DioError(
                requestOptions: response.requestOptions,
                type: DioErrorType.unknown,
                response: Response(
                    requestOptions: response.requestOptions,
                    statusCode: 401,
                    data: resultData),
                error: 'Http status error [401]'));
          }
        }
      }
    }
    if (response.requestOptions.path.toLowerCase().contains('refreshtoken')) {
      return handler.next(err);
    }
    return super.onError(err, handler);
  }

  Future<Map<String, dynamic>?>? callRefresh(Response? response) async {
    var refreshAPI = Common.apiRefreshToken;
    var reqHeaders = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    String accessToken =
        await UserSecureStorage.instance.getAccessToken() ?? '';
    String refreshToken =
        await UserSecureStorage.instance.getRefreshToken() ?? '';

    var params = {
      "access_token": accessToken,
      "refresh_token": refreshToken,
    };
    var response = await baseDio.post<RefreshModel>(refreshAPI,
        headers: reqHeaders, data: params);
    switch (response.result) {
      case TaskResult.success:
        if (response.data != null) {
          await HelperFunction.instance.removeJwt();
          await HelperFunction.instance
              .saveJwt(response.data!.accessToken, response.data!.refreshToken);
        }
        // get new token ok
        return null;
      default:
        await HelperFunction.instance.removeJwt();
        return {
          'data': response.data,
          'messageCode': response.messageCode,
          'messageContent': response.messageContent
        };
    }
  }

  bool mustHaveToken(String url) {
    for (var item in nonTokenList) {
      if (url.toLowerCase().contains(item)) {
        return false;
      }
    }
    return true;
  }

  final List<String> nonTokenList = [
    "/customer/login",
  ];
}
