import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:arklevelcalculator/base/api_response.dart';
import 'package:arklevelcalculator/schema/request/login_request.dart';
import 'package:arklevelcalculator/schema/user.dart';
import 'package:arklevelcalculator/schema/user_login.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @POST('/user/login-phone')
  Future<APIResponse<UserLogin>> login(@Body() LoginRequest request);
}
