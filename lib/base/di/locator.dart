import 'package:get_it/get_it.dart';
import 'package:arklevelcalculator/datasource/local/shared_preferences_repo.dart';
import 'package:arklevelcalculator/datasource/remote/api_client.dart';
import 'package:arklevelcalculator/datasource/repo/user_repo.dart';
import 'package:arklevelcalculator/feature/splash_screen/splash_viewmodel.dart';

GetIt locator = GetIt.instance;

void setUpInjector() {
  ///  Inject SharedPreferencesRepository
  locator.registerLazySingleton(() => SharedPreferencesRepository());

  locator.registerLazySingleton(() => ApiClient());

  /// Inject repo
  locator.registerLazySingleton(() => UserRepo());

  /// Inject view model
  locator.registerFactory<SplashScreenViewModel>(() => SplashScreenViewModel());
}
