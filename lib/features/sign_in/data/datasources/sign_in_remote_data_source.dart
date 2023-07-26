import 'package:new_ark_calc/core/config/common.dart';
import 'package:new_ark_calc/core/error/exceptions.dart';
import 'package:new_ark_calc/core/network/dio_base.dart';
import 'package:new_ark_calc/core/network/task_type.dart';

import '../models/sign_in_model.dart';

abstract class SignInRemoteDataSource {
  Future<SignInModel> login(
      {required String phoneNumber,
      required String countryCode,
      required String accessToken});
}

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  final BaseDio baseDio;

  SignInRemoteDataSourceImpl(this.baseDio);

  @override
  Future<SignInModel> login(
      {required String phoneNumber,
      required String countryCode,
      required String accessToken}) async {
    String url = Common.apiLogin;

    var params = <String, dynamic>{
      'phone': phoneNumber,
      'access_token': accessToken,
      "country_code": countryCode
    };

    final response =
        await baseDio.request<SignInModel>(url, MethodType.POST, data: params);

    switch (response.result) {
      case TaskResult.success:
        if (response.error) {
          throw ServerException(
            response.messageCode,
            response.messageContent,
          );
        }
        return response.data!;
      default:
        throw ServerException(
          response.messageCode,
          response.messageContent,
        );
    }
  }
}
