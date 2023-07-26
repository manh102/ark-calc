import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '/core/extensions/context_extension.dart';
import '/core/navigation/navigation_observer.dart';
import '/core/navigation/scaffold_with_nav_bar.dart';
import '/core/util/system_ui_util.dart';
import '/core/widgets/common/template_page.dart';
import '/features/handbooks/presentation/pages/handbooks_page.dart';
import '/features/home/presentation/pages/home_page.dart';
import '/features/profile/presentation/bloc/profile_bloc.dart';
import '/features/profile/presentation/pages/profile_page.dart';
import '/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import '/features/sign_in/presentation/pages/sign_in_page.dart';
import '/features/sign_in/presentation/pages/verify_otp_page.dart';
import '/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/injection_container.dart' as di;
import '../widgets/common/error_page.dart';
import '../widgets/common/top_app_bar/top_app_bar_widget.dart';
import 'app_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> _homeTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'homeTabNav');
final GlobalKey<NavigatorState> _handbooksTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'handbooksTabNav');
final GlobalKey<NavigatorState> _accountTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'accountTabNav');

class AppRouteGenerator {
  static final List<ScaffoldWithNavBarTabItem> _tabs =
      <ScaffoldWithNavBarTabItem>[
    ScaffoldWithNavBarTabItem(
        rootRoutePath: AppRoutes.handbooksTab.path,
        navigatorKey: _handbooksTabNavigatorKey,
        assetIcon: "assets/images/svg/manual_inactive_ic.svg",
        title: "Handbooks",
        tabIndex: 0),
    ScaffoldWithNavBarTabItem(
        rootRoutePath: AppRoutes.homeTab.path,
        navigatorKey: _homeTabNavigatorKey,
        assetIcon: "assets/images/svg/home_inactive_ic.svg",
        title: "Home",
        tabIndex: 1),
    ScaffoldWithNavBarTabItem(
        rootRoutePath: AppRoutes.accountTab.path,
        navigatorKey: _accountTabNavigatorKey,
        assetIcon: "assets/images/svg/profile_actived_ic.svg",
        title: "Account",
        tabIndex: 2)
  ];

  late final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.root.path,
    observers: [PSNavigationObserver()],
    routes: [
      GoRoute(
        name: AppRoutes.root.namedRoute,
        path: AppRoutes.root.path,
        redirect: (context, state) async {
          await ScreenUtil.ensureScreenSize();

          /// ENABLE IF USE LOGIN PAGE
          // return FirebaseAuth.instance.currentUser == null
          //     ? AppRoutes.signInPage.path
          //     : AppRoutes.homeTab.path;

          /// GO STRAIGHT TO HOME
          return AppRoutes.homeTab.path;
        },
      ),
      ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (_) => sl<SignInBloc>(),
              child: TemplatePage(
                key: state.pageKey,
                child: child,
                topAppBarStyle: PSTopAppBarStyle.transparent,
                showTopAppBar: false,
                showBottomNavBar: false,
              ),
            );
          },
          routes: <RouteBase>[
            GoRoute(
                name: AppRoutes.signInPage.namedRoute,
                path: AppRoutes.signInPage.path,
                builder: (context, state) => SignInPage(
                      key: state.pageKey,
                    )),
            GoRoute(
              name: AppRoutes.verifyOtpPage.namedRoute,
              path: AppRoutes.verifyOtpPage.path,
              builder: (context, state) {
                final phoneNumber = state.queryParameters["phoneNumber"] ?? "";

                return VerifyOtpPage(
                    key: state.pageKey, phoneNumber: phoneNumber);
              },
            ),
          ]),
      BottomTabBarShellRoute(
          navigatorKey: shellNavigatorKey,
          scaffoldKey: _homeNavigatorKey,
          tabs: _tabs,
          routes: [
            GoRoute(
              name: AppRoutes.homeTab.namedRoute,
              path: AppRoutes.homeTab.path,
              builder: (context, state) {
                SystemUiUtils.instance
                    .onChangeSystemUiStylePerRoute(state.location);

                bool isLoggedIn = FirebaseAuth.instance.currentUser != null;
                if (state.extra != null) {
                  final extra = state.extra as Map<String, dynamic>;
                  if (extra.containsKey("isLoggedIn")) {
                    isLoggedIn = extra["isLoggedIn"] as bool;
                  }
                }

                return BlocProvider(
                  create: (_) => sl<HomeBloc>(),
                  child: HomePage(key: state.pageKey, isLoggedIn: isLoggedIn),
                );
              },
            ),
            GoRoute(
              name: AppRoutes.handbooksTab.namedRoute,
              path: AppRoutes.handbooksTab.path,
              redirect: (context, state) => context.redirectIfUnauthenticated(),
              builder: (context, state) {
                return HandbooksPage(key: state.pageKey);
              },
            ),
            GoRoute(
              name: AppRoutes.accountTab.namedRoute,
              path: AppRoutes.accountTab.path,
              redirect: (context, state) => context.redirectIfUnauthenticated(),
              builder: (context, state) {
                return BlocProvider(
                  create: (_) => sl<ProfileBloc>(),
                  child: ProfilePage(key: state.pageKey),
                );
              },
            ),
          ]),
    ],
    errorPageBuilder: (context, state) =>
        MaterialPage(key: state.pageKey, child: ErrorPage(key: state.pageKey)),
  );
}

extension GoRouteExt on GoRouter {
  void popAndRefresh<T extends Object?>([T? result]) {
    this.pop(result);
  }

  Future<void> backToSignIn<T extends Object?>(
      {required BuildContext context, bool forceResetSession = true}) async {
    if (forceResetSession) {
      await di.resetSignOutSession();
    }
    this.refresh();
    this.goNamed(AppRoutes.root.namedRoute);
  }

  void goToRewardDetailPage({required int rewardId}) {
    this.pushNamed(AppRoutes.rewardDetailPage.namedRoute,
        pathParameters: {"rewardId": rewardId.toString()});
  }
}

class BottomTabBarShellRoute extends ShellRoute {
  final List<ScaffoldWithNavBarTabItem> tabs;

  BottomTabBarShellRoute({
    required this.tabs,
    GlobalKey<NavigatorState>? navigatorKey,
    List<RouteBase> routes = const <RouteBase>[],
    Key? scaffoldKey = const ValueKey('ScaffoldWithNavBar'),
  }) : super(
            navigatorKey: navigatorKey,
            routes: routes,
            builder: (context, state, Widget fauxNav) {
              return Stack(
                children: [
                  // Needed to keep the (faux) shell navigator alive
                  Offstage(child: fauxNav),
                  ScaffoldWithNavBar(
                      tabs: tabs,
                      key: scaffoldKey,
                      currentNavigator:
                          (fauxNav as HeroControllerScope).child as Navigator,
                      currentRouterState: state,
                      routes: routes),
                ],
              );
            });
}
