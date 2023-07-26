import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/util/core_util.dart';
import 'package:new_ark_calc/core/util/image_type_enum.dart';
import 'package:new_ark_calc/core/util/system_ui_util.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';
import 'package:new_ark_calc/core/widgets/common/top_app_bar/top_app_bar_widget.dart';
import 'package:new_ark_calc/core/widgets/common_typedef.dart';

import 'buttons/icon_with_button.dart';
import 'chips/chip_list_widget.dart';

class TemplatePage extends StatelessWidget {
  final Widget child;
  final bool showBottomNavBar;
  final bool showTopAppBar;
  final PSTopAppBarStyle topAppBarStyle;
  final Widget? bottomNavigationBar;
  final PSTopAppBar? topAppBar;

  const TemplatePage(
      {super.key,
      required this.child,
      this.bottomNavigationBar,
      this.topAppBar,
      this.showBottomNavBar = false,
      this.showTopAppBar = false,
      PSTopAppBarStyle? topAppBarStyle})
      : this.topAppBarStyle = topAppBarStyle ?? PSTopAppBarStyle.normal;

  @override
  Widget build(BuildContext context) {
    bool isTransparentTopAppBar =
        topAppBarStyle == PSTopAppBarStyle.transparent;

    final systemUiOverlayStyle = SystemUiUtils.instance
        .getSystemUiStyle(isTransparentAppBar: isTransparentTopAppBar);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyle,
      child: Scaffold(
        body: isTransparentTopAppBar
            ? Container(
                width: 1.sw,
                height: 1.sh,
                decoration: SoloerColors.soloerBackground,
                child: SafeArea(
                  child: child,
                ),
              )
            : SafeArea(
                bottom: false,
                top: false,
                right: false,
                left: false,
                child: Container(
                  color: SoloerColors.background,
                  width: 1.sw,
                  height: 1.sh,
                  child: child,
                ),
              ),
        backgroundColor: topAppBarStyle.backgroundColor,
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: showBottomNavBar ? bottomNavigationBar : null,
        appBar: showTopAppBar ? topAppBar : null,
      ),
    );
  }
}

mixin TemplatePageMixin {
  Widget wrapInScrollableTemplatePage(
    List<Widget> children, {
    AlignmentGeometry? alignment,
    bool? isHorizontalPadding = false,
    Color? backgroundColor,
    Decoration? decoration,
    ScrollController? scrollController,
  }) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      alignment: alignment,
      decoration: decoration,
      color: backgroundColor,
      padding: EdgeInsets.only(
        top: PSSpacing.topAppBarHeight + ScreenUtil().statusBarHeight,
        bottom: PSSpacing.bottomNavBarHeight,
        left: (isHorizontalPadding ?? false) ? PSSpacing.horizontalMargin : 0.0,
        right:
            (isHorizontalPadding ?? false) ? PSSpacing.horizontalMargin : 0.0,
      ),
      child: SingleChildScrollView(
        controller:
            scrollController != null ? scrollController : ScrollController(),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: children,
        ),
      ),
    );
  }

  Widget wrapInNoScrollableTemplatePage(List<Widget> children,
      {AlignmentGeometry? alignment,
      bool? isHorizontalPadding = false,
      Color? backgroundColor,
      Decoration? decoration}) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      alignment: alignment,
      decoration: decoration,
      color: backgroundColor,
      padding: EdgeInsets.only(
        bottom: 65.h,
        left: (isHorizontalPadding ?? false) ? PSSpacing.horizontalMargin : 0.0,
        right:
            (isHorizontalPadding ?? false) ? PSSpacing.horizontalMargin : 0.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget wrapInTemplatePage(List<Widget> children,
      {AlignmentGeometry? alignment,
      bool? isHorizontalPadding = false,
      Color? backgroundColor,
      Decoration? decoration}) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      alignment: alignment,
      decoration: decoration,
      color: backgroundColor,
      padding: EdgeInsets.only(
        top: PSSpacing.verticalMargin,
        bottom: PSSpacing.verticalMargin,
        left: (isHorizontalPadding ?? false) ? PSSpacing.horizontalMargin : 0.0,
        right:
            (isHorizontalPadding ?? false) ? PSSpacing.horizontalMargin : 0.0,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return children[index];
        },
        shrinkWrap: true,
        itemCount: children.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget wrapInTemplatePageEqually(
    List<Widget> children, {
    Color? backgroundColor,
    Decoration? decoration,
    AlignmentGeometry? alignment,
    bool? isHorizontalPadding = false,
  }) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      alignment: alignment,
      decoration: decoration,
      color: backgroundColor,
      padding: EdgeInsets.only(
        top: PSSpacing.verticalMargin,
        bottom: PSSpacing.verticalMargin,
        left: (isHorizontalPadding ?? false) ? PSSpacing.horizontalMargin : 0.0,
        right:
            (isHorizontalPadding ?? false) ? PSSpacing.horizontalMargin : 0.0,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: PSSpacing.betweenItemSpace),
            child: children[index],
          );
        },
        shrinkWrap: true,
        itemCount: children.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget wrapInHorizontalPadding({required Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PSSpacing.horizontalMargin),
      child: child,
    );
  }

  Widget buildCategoryListWidget(
      {required List<String> items,
      int selectedIndex = 0,
      required void Function(int) onSelectedChip}) {
    return Container(
      height: 35.h,
      child: SelectableChipListWidget(
        items: ["All", "Shop Membership", "Event Ticketing", "On Sale"],
        selectedIndex: selectedIndex,
        onSelectedChip: onSelectedChip,
      ),
    );
  }

  Widget buildSortSectionWidget({
    required Function() onCategoryTapped,
    required Function() onSortTapped,
  }) {
    return Padding(
      padding: EdgeInsets.only(
          left: PSSpacing.horizontalMargin - 7.w,
          right: PSSpacing.horizontalMargin - 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: IconWithButton(
            label: "All Categories",
            icon: "assets/images/svg/ic_caret_down.svg",
            onTapped: onCategoryTapped,
            isIconLeading: false,
          )),
          Flexible(
              child: IconWithButton(
            label: "Sort",
            icon: "assets/images/svg/ic_sort.svg",
            onTapped: onSortTapped,
          ))
        ],
      ),
    );
  }

  Widget buildSectionTitle(
      {required String title,
      bool hasArrowIndicator = false,
      double horizontalPadding = 24.0,
      OnSeeMoreTapped? onSeeMoreTapped}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: PSText.cardBigTitle(
              title,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
          Visibility(
              visible: hasArrowIndicator,
              child: GestureDetector(
                onTap: () {
                  onSeeMoreTapped?.call();
                  Logging.log.info("Đã click");
                },
                child: "assets/images/svg/ic_arrow_right.svg"
                    .getImageWidget(width: 12.w),
              )),
        ],
      ),
    );
  }

  Widget buildSection({
    required String sectionTitle,
    bool hasArrowIndicator = false,
    double horizontalPadding = 24.0,
    bool includeBottomDivider = true,
    EdgeInsetsGeometry? bottomDividerPadding,
    required Widget body,
    OnSeeMoreTapped? onSeeMoreTapped,
  }) {
    return Column(
      children: [
        buildSectionTitle(
            title: sectionTitle,
            hasArrowIndicator: hasArrowIndicator,
            horizontalPadding: horizontalPadding,
            onSeeMoreTapped: onSeeMoreTapped),
        PSSpacing.sectionVerticalPadding.verticalSpace,
        body,
        Visibility(
            visible: includeBottomDivider,
            child: Padding(
              padding: bottomDividerPadding ??
                  EdgeInsets.only(top: 24.h, bottom: 24.h),
              child: buildHorizontalDivider(),
            )),
      ],
    );
  }

  Widget buildHorizontalDivider({
    EdgeInsets? horizontalPadding,
  }) =>
      Divider(
        height: 1,
        indent: horizontalPadding?.left ?? PSSpacing.horizontalMargin,
        endIndent: horizontalPadding?.right ?? PSSpacing.horizontalMargin,
        thickness: 1,
      );
}
