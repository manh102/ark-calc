import 'package:arklevelcalculator/base/base_viewmodel.dart';
import 'package:arklevelcalculator/base/di/locator.dart';
import 'package:arklevelcalculator/datasource/local/shared_preferences_repo.dart';
import 'package:arklevelcalculator/datasource/repo/user_repo.dart';

class SplashScreenViewModel extends BaseViewModel {
  SharedPreferencesRepository _sharedPreferencesRepository =
      locator<SharedPreferencesRepository>();

  UserRepo _authRepo = locator<UserRepo>();

  Future<String> getAccessToken() async {
    String token = await _sharedPreferencesRepository.getToken();
    return token;
  }
}
