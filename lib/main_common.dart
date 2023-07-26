import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/navigation/app_route_generator.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/features/app_bloc/app_bloc.dart';
import 'core/config/app_properties.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;
import 'package:provider/provider.dart';

Future<void> mainCommon(AppProperties config) async {
  AppProperties.instance = config;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  await di.init();

  configDeviceOrientation();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ja', 'JP')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

void configDeviceOrientation() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider(
          create: (context) => AppRouteGenerator(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AppBloc(),
        )
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          final router =
              Provider.of<AppRouteGenerator>(context, listen: true).router;

          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            routerDelegate: router.routerDelegate,
            debugShowCheckedModeBanner: false,
            title: "PointSuite App",
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: PSTheme.themeData,
            builder: EasyLoading.init(builder: (context, child) {
              if (EasyLoading.isShow) {
                EasyLoading.dismiss();
              }

              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            }),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
