import 'package:flustars_flutter3/flustars_flutter3.dart' as flustarUtil;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ark_calc/core/navigation/app_routes.dart';
import 'package:new_ark_calc/core/resources/colors.dart';
import 'package:new_ark_calc/core/widgets/common/custom_bottom_nav_bar.dart';
import 'package:new_ark_calc/core/widgets/common/template_page.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';
import 'package:new_ark_calc/features/app_bloc/app_bloc.dart';

import '../widgets/common/top_app_bar/top_app_bar_widget.dart';

/// Representation of a tab item in a [ScaffoldWithNavBar]
/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends StatefulWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.currentNavigator,
    required this.currentRouterState,
    required this.tabs,
    required this.routes,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigator for the currently active tab
  final Navigator currentNavigator;

  /// The pages for the current route
  List<Page<dynamic>> get pagesForCurrentRoute => currentNavigator.pages;

  /// The current router state
  final GoRouterState currentRouterState;

  /// The tabs
  final List<ScaffoldWithNavBarTabItem> tabs;

  // The routes
  final List<RouteBase> routes;

  @override
  State<StatefulWidget> createState() => ScaffoldWithNavBarState();
}

/// State for ScaffoldWithNavBar
class ScaffoldWithNavBarState extends State<ScaffoldWithNavBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final List<_NavBarTabNavigator> _tabs;
  bool isDynamicBottomBar = true;

  int _locationToTabIndex(String location) {
    final int index = _tabs.indexWhere(
        (_NavBarTabNavigator t) => location.startsWith(t.rootRoutePath));
    return index < 0 ? 0 : index;
  }

  int _currentIndex = 0;
  late AppBloc appBloc;

  @override
  void initState() {
    appBloc = context.read<AppBloc>();
    super.initState();
    _tabs = widget.tabs
        .map((ScaffoldWithNavBarTabItem e) => _NavBarTabNavigator(e))
        .toList();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant ScaffoldWithNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateForCurrentTab();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateForCurrentTab();
  }

  void _updateForCurrentTab() {
    final int previousIndex = _currentIndex;
    final location = GoRouter.of(context).location;
    _currentIndex = _locationToTabIndex(location);

    final _NavBarTabNavigator tabNav = _tabs[_currentIndex];
    tabNav.pages = widget.pagesForCurrentRoute;
    tabNav.lastLocation = location;

    if (previousIndex != _currentIndex) {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).location;

    final currentRoute = AppRoutes.getRoute(
        (value) => value.namedRoute == location.substring(1));
    final isChildPage = AppRoutes.isChildPage(location);

    final isTemplateChildPage =
        AppRoutes.isTemplateChildPage(GoRouter.of(context).location);

    final showTopAppBar = currentRoute?.showTopAppBar ?? true;
    // Normal usecase (always show bottom bar) just use this var only, no need AppBloc
    final showBottomAppBar = currentRoute?.showBottomAppBar ?? true;

    final topAppBar = showTopAppBar
        ? PSTopAppBar.home(
            title: currentRoute?.title ?? "",
            onSearchActionTapped: () {
              //
            },
            onFavoriteActionTapped: () async {},
            onFAQActionTapped: () {
              //
            },
          )
        : null;

    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) async {},
      builder: (context, state) {
        // if current page is not Homepage, always show bottom bar
        if (state is AppBottomBarState && currentRoute?.namedRoute == 'home') {
          isDynamicBottomBar = state.isShowBottomBar;
        }
        return TemplatePage(
          child: _buildBody(context),
          topAppBarStyle: currentRoute?.topAppBarStyle,
          showTopAppBar: currentRoute?.showTopAppBar ?? false,
          showBottomNavBar:
              !isChildPage && !isTemplateChildPage && showBottomAppBar,
          bottomNavigationBar: _buildBottomNavigationBar(context,
              isShowBottomAppBar: currentRoute?.namedRoute == 'home'
                  ? isDynamicBottomBar
                  : showBottomAppBar),
          topAppBar: topAppBar,
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context,
      {bool isShowBottomAppBar = true}) {
    PSBottomNavBarItem _buildBottomNavigationBarItem(
        ScaffoldWithNavBarTabItem tabItem) {
      return PSBottomNavBarItem(
        icon: SvgPicture.asset(
          tabItem.assetIcon,
          height: 20.h,
          width: 20.h,
          colorFilter: _currentIndex == tabItem.tabIndex
              ? ColorFilter.mode(
                  SoloerColors.green_bg,
                  BlendMode.srcIn,
                )
              : ColorFilter.mode(
                  SoloerColors.unselectedTabColor, BlendMode.srcIn),
        ),
        title: PSText.bottomNavItemTitle(
          tabItem.title,
          color: _currentIndex == tabItem.tabIndex
              ? SoloerColors.green_bg
              : SoloerColors.unselectedTabColor,
        ),
      );
    }

    return PSBottomNavigationBar(
      items: _tabs
          .map((e) => _buildBottomNavigationBarItem(e.bottomNavigationTab))
          .toList(),
      currentIndex: _currentIndex,
      onTap: (int idx) => _onItemTapped(idx, context),
      selectedItemColor: SoloerColors.primary,
      unselectedItemColor: SoloerColors.primary.withOpacity(0.32),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FadeTransition(
        opacity: _animationController,
        child: IndexedStack(
            index: _currentIndex,
            children: _tabs
                .map((_NavBarTabNavigator tab) => tab.buildNavigator(context))
                .toList()));
  }

  void _onItemTapped(int index, BuildContext context) {
    GoRouter.of(context).go(_tabs[index].rootRoutePath);
  }
}

class ScaffoldWithNavBarTabItem {
  /// Constructs an [ScaffoldWithNavBarTabItem].
  ScaffoldWithNavBarTabItem(
      {required this.rootRoutePath,
      required this.navigatorKey,
      required this.assetIcon,
      required this.title,
      required this.tabIndex});

  final String assetIcon;

  final String title;

  final int tabIndex;

  /// The initial location/path
  final String rootRoutePath;

  /// Optional navigatorKey
  final GlobalKey<NavigatorState> navigatorKey;
}

/// Class representing a tab along with its navigation logic
class _NavBarTabNavigator {
  _NavBarTabNavigator(this.bottomNavigationTab);

  final ScaffoldWithNavBarTabItem bottomNavigationTab;

  String? lastLocation;

  String get currentLocation =>
      lastLocation != null ? lastLocation! : rootRoutePath;

  String get rootRoutePath => bottomNavigationTab.rootRoutePath;

  Key? get navigatorKey => bottomNavigationTab.navigatorKey;
  List<Page<dynamic>> pages = <Page<dynamic>>[];

  Widget buildNavigator(BuildContext context) {
    if (pages.isNotEmpty) {
      return Navigator(
        key: navigatorKey,
        pages: pages,
        onPopPage: (Route<dynamic> route, dynamic result) {
          if (pages.length == 1 || !route.didPop(result)) {
            return false;
          }
          GoRouter.of(context).pop();
          return true;
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
