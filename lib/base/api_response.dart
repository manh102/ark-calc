import 'package:dio/dio.dart';
import 'package:arklevelcalculator/logger/app_logger.dart';
import 'package:arklevelcalculator/resources/app_lang.dart';
import 'package:arklevelcalculator/schema/api_message.dart';
import 'package:arklevelcalculator/schema/user.dart';
import 'package:arklevelcalculator/schema/user_login.dart';

class APIResponse<T> {
  // From API
  ApiMessage message;
  bool isSuccess;
  List<ApiMessage> errors;
  T data;

  // For local handel
  int errorCode;

  APIResponse({
    this.message,
    this.errors,
    this.isSuccess,
    this.data,
    this.errorCode,
  });

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    APIResponse<T> apiResponse = APIResponse<T>(
      message: ApiMessage.fromJson(json['message']),
      errors: (json['errors'] as List)
          ?.map((e) =>
              e == null ? null : ApiMessage.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      isSuccess: json['isSuccess'] as bool,
    );

    if (!apiResponse.isSuccess) {
      return apiResponse;
    }

    var data = json['data'];

    if (data == null) {
      return apiResponse;
    }

    if (data is Map) {
      switch (T.toString()) {
        case User.classType:
          //String token = json['data']['access_token'];
          apiResponse.data = User.fromJson(data) as T;
          break;

        case UserLogin.classType:
          apiResponse.data = UserLogin.fromJson(data) as T;
          break;

        default:
          throw Exception('Data type [${T.toString()}] is not supported');
          break;
      }

      return apiResponse;
    }

    /// Data as list
    switch (T.toString()) {
      case 'List<String>':
        apiResponse.data =
            ((data as List)?.map((e) => e.toString())?.toList()) as T;
        break;

//      case 'List<Garden>':
//        apiResponse.data = ((data as List)
//            ?.map((e) => Garden.fromJson(e as Map<String, dynamic>))
//            ?.toList()) as T;
//        break;

      default:
        throw Exception('Data type [${T.toString()}] is not supported');
        break;
    }

    return apiResponse;
  }

  factory APIResponse.fromException(ex) {
    AppLogger.e(ex);

    int errorCode = 500;

    if (ex is DioError) {
      AppLogger.e(ex.message);

      switch (ex.type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
          errorCode = 408;
          break;
        case DioErrorType.RESPONSE:
          if (ex.response != null) {
            errorCode = ex.response.statusCode;
          } else {
            errorCode = 500;
          }

          break;
        case DioErrorType.CANCEL:
          errorCode = 499;
          break;

        case DioErrorType.DEFAULT:
          errorCode = 500;
          break;
      }
    }

    return APIResponse(
      isSuccess: false,
      errorCode: errorCode,
      errors: [
        ApiMessage(
          key: AppLang.common_error_message,
          message: 'Have error.',
        ),
      ],
    );
  }
}
