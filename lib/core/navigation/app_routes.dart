import '../widgets/common/top_app_bar/top_app_bar_widget.dart';

enum AppRoutes {
  root(namedRoute: "root", path: "/"),
  authPage(namedRoute: "auth", path: "/auth"),
  signInPage(
    namedRoute: "signIn",
    path: "/signIn",
    topAppBarStyle: PSTopAppBarStyle.transparent,
  ),
  verifyOtpPage(
    namedRoute: "verifyOtp",
    path: "/verifyOtp",
    topAppBarStyle: PSTopAppBarStyle.transparent,
  ),
  homeTab(namedRoute: "home", path: "/home", tabIndex: 0, title: "Home"),
  handbooksTab(
      namedRoute: "handbooks",
      path: "/handbooks",
      tabIndex: 3,
      title: "Handbooks"),
  accountTab(
      namedRoute: "account", path: "/account", tabIndex: 4, title: "Account"),
  profilePage(namedRoute: "profile", path: "/profile"),
  rewardDetailPage(
      namedRoute: "reward-detail",
      path: "/reward-detail/:rewardId",
      showTopAppBar: false,
      showBottomAppBar: false),
  ;

  final String? title;
  final String namedRoute;
  final String path;
  final int? tabIndex;
  final PSTopAppBarStyle topAppBarStyle;
  final bool showTopAppBar;
  final bool showBottomAppBar;

  const AppRoutes(
      {required this.namedRoute,
      required this.path,
      this.title,
      this.tabIndex,
      this.topAppBarStyle = PSTopAppBarStyle.normal,
      this.showTopAppBar = true,
      this.showBottomAppBar = true});

  static AppRoutes? getRoute(bool Function(AppRoutes value) predicate) {
    final matchedRoutes = AppRoutes.values.where(predicate);

    return matchedRoutes.isNotEmpty ? matchedRoutes.first : null;
  }

  static bool isChildPage(String location) {
    return RegExp('/').allMatches(location).length > 1;
  }

  static bool isTemplateChildPage(String path) {
    return path.contains('/profile');
  }
}
