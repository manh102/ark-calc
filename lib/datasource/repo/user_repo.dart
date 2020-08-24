import 'package:arklevelcalculator/base/api_response.dart';
import 'package:arklevelcalculator/base/base_repo.dart';
import 'package:arklevelcalculator/schema/request/login_request.dart';
import 'package:arklevelcalculator/schema/user.dart';
import 'package:arklevelcalculator/schema/user_login.dart';

class UserRepo extends BaseRepository {
  Future<APIResponse<UserLogin>> login(LoginRequest request) async {
    try {
      APIResponse<UserLogin> res = await apiClient.userService.login(request);
      return res;
    } catch (ex) {
      return APIResponse.fromException(ex);
    }
  }
}
