import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'core/config/common.dart';
import 'core/network/interceptors/log_interceptor.dart';
import 'core/network/dio_base.dart';
import 'core/secure_storage/share_preferences.dart';
import 'core/secure_storage/user_secure_storage.dart';
import 'core/widgets/dialog/dialog.dart';

import 'features/app_bloc/app_bloc.dart';
import 'features/home/data/data_sources/home_remote_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_brand_usecase.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/data/data_sources/home_local_data_source.dart';
import 'features/home/data/models/brand_hive.dart';
import 'features/home/data/models/category_hive.dart';
import 'features/home/domain/usecases/get_category_usecase.dart';
import 'features/home/domain/usecases/get_explore_rewards_usecase.dart';
import 'features/home/domain/usecases/get_my_rewards_usecase.dart';
import 'features/profile/data/data_sources/profile_remote_data_source.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/profile/domain/repositories/profile_repository.dart';
import 'features/profile/domain/use_cases/change_user_avatar_use_case.dart';
import 'features/profile/domain/use_cases/get_profile_use_case.dart';
import 'features/profile/domain/use_cases/update_profile_use_case.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/domain/use_cases/sign_out_use_case.dart';
import 'features/sign_in/data/datasources/sign_in_local_data_source.dart';
import 'features/sign_in/data/datasources/sign_in_remote_data_source.dart';
import 'features/sign_in/data/repositories/sign_in_repository_impl.dart';
import 'features/sign_in/domain/repositories/sign_in_repository.dart';
import 'features/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'features/sign_in/presentation/bloc/sign_in_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _injectCores();
  await _injectDataSources();
  await _injectRepositories();
  await _injectUseCases();
  await _injectBloc();
}

Future<void> _injectCores() async {
  sl.registerLazySingleton<Dio>(() {
    final options = BaseOptions(
        baseUrl: Common.serverUrl,
        connectTimeout: Duration(milliseconds: Common.defaultTimeOut));
    final dio = Dio(options);
    dio.interceptors.add(DefaultLogInterceptor());
    return dio;
  });
  sl.registerFactory<UserSecureStorage>(() => UserSecureStorage());
  sl.registerLazySingleton<BaseStorage>(() => BaseStorage());
  await BaseStorage.instance.init();
  sl.registerLazySingleton<BaseDio>(() => BaseDio(sl()));
  await initHiveDB();
  sl.registerLazySingleton<PSDialog>(() => PSDialog());
}

Future<void> _injectDataSources() async {
  sl.registerLazySingleton<SignInLocalDataSource>(
      () => SignInLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<SignInRemoteDataSource>(
      () => SignInRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(sl()));
}

Future<void> _injectRepositories() async {
  sl.registerLazySingleton<SignInRepository>(
      () => SignInRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(sl()));
}

Future<void> _injectBloc() async {
  sl.registerFactory<AppBloc>(() => AppBloc());
  sl.registerFactory<SignInBloc>(
    () => SignInBloc(signInUseCase: sl<SignInUseCase>()),
  );
  sl.registerFactory<HomeBloc>(
    () => HomeBloc(
        getBrandUseCase: sl(),
        getCategoryUseCase: sl(),
        getExploreRewardsUseCase: sl(),
        getMyRewardsUseCase: sl(),
        getProfileUseCase: sl()),
  );
  sl.registerFactory<ProfileBloc>(() => ProfileBloc(sl(), sl(), sl(), sl()));
}

Future<void> _injectUseCases() async {
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(sl()));
  sl.registerLazySingleton<GetBrandUseCase>(() => GetBrandUseCase(sl()));
  sl.registerLazySingleton<GetCategoryUseCase>(() => GetCategoryUseCase(sl()));
  sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton<UpdateProfileUseCase>(
      () => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton<ChangeUserAvatarUseCase>(
      () => ChangeUserAvatarUseCase(sl()));
  sl.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(sl()));
  sl.registerLazySingleton<GetExploreRewardsUseCase>(
      () => GetExploreRewardsUseCase(sl()));
  sl.registerLazySingleton<GetMyRewardsUseCase>(
      () => GetMyRewardsUseCase(sl()));
}

Future<void> resetSignOutSession() async {
  if (FirebaseAuth.instance.currentUser != null) {
    await FirebaseAuth.instance.signOut();
  }
  sl.get<UserSecureStorage>().deleteAccessToken();
  sl.get<UserSecureStorage>().deleteRefreshToken();
  sl.get<UserSecureStorage>().deleteUserId();
  await BaseStorage.instance.prefs.clear();
}

Future<void> initHiveDB() async {
  var dir;

  if (Platform.isAndroid) {
    dir = await getExternalStorageDirectory();
  } else if (Platform.isIOS) {
    dir = await getApplicationDocumentsDirectory();
  }
  var rootPath = Directory(join(dir!.path, "PointSuite")).path;
  Hive.init(rootPath);
  Hive.registerAdapter(BrandHiveAdapter(), override: true);
  Hive.registerAdapter(CategoryHiveAdapter(), override: true);
}
