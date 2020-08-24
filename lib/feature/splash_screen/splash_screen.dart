import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:route_annotation/route_annotation.dart';
import 'package:arklevelcalculator/base/base_screen.dart';
import 'package:arklevelcalculator/base/di/locator.dart';
import 'package:arklevelcalculator/feature/splash_screen/splash_viewmodel.dart';
import 'package:arklevelcalculator/resources/app_color.dart';
import 'package:arklevelcalculator/resources/app_dimen.dart';

@RoutePage(isInitialRoute: true)
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseScreen<SplashScreen> {
  SplashScreenViewModel splashViewModel = locator<SplashScreenViewModel>();

  @override
  void initState() {
    super.initState();

    Future.microtask(() => loadData());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => splashViewModel,
      child: Consumer<SplashScreenViewModel>(
        builder: (context, splashViewModel, child) {
          return Scaffold(
            body: Container(
              color: AppColor.white,
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          left: AppDimen.app_margin,
                          right: AppDimen.app_margin,
                          bottom: 100,
                        ),
                        height: 400,
                      )
                    ],
                  ),
                  Container(
                    child: SpinKitDoubleBounce(
                      color: AppColor.mainColor,
                      size: 50,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<Timer> loadData() async {
    String token = await splashViewModel.getAccessToken();
    if (token != null) {
      return Timer(Duration(seconds: 1), onDoneLoading);
    } else {
      return new Timer(Duration(seconds: 1), onNewLoading);
    }
  }

  onDoneLoading() async {
    // User logged in -> go to homepage
    //Navigator.of(context).pushNamed(ROUTE_NAVIGATION_SCREEN);
    //Navigator.of(context).pushNamed(ROUTE_PROFILE_SCREEN);
  }

  onNewLoading() async {
    // New login
    // Navigator.of(context).pushNamed(ROUTE_START_SCREEN);
    //Navigator.of(context).pushNamed(ROUTE_NAVIGATION_SCREEN);
  }
}
