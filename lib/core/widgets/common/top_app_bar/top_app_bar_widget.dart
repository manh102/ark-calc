import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';

import '../../common_typedef.dart';

class PSTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final PSTopAppBarStyle topAppBarStyle;
  final bool showBackButton;
  final OnBackTapped? onBackTapped;
  final List<PSTopAppBarAction>? actions;
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  @override
  final Size preferredSize;

  PSTopAppBar(
      {this.title,
      PSTopAppBarStyle? topAppBarStyle,
      this.showBackButton = false,
      this.onBackTapped,
      this.systemUiOverlayStyle,
      this.actions})
      : this.topAppBarStyle = topAppBarStyle ?? PSTopAppBarStyle.normal,
        preferredSize = Size.fromHeight(kToolbarHeight);

  factory PSTopAppBar.home(
      {required String title,
      required OnSearchActionTapped onSearchActionTapped,
      required OnFavoriteActionTapped onFavoriteActionTapped,
      required OnFAQActionTapped onFAQActionTapped}) {
    return PSTopAppBar(
      title: title,
      actions: [
        PSTopAppBarAction(
            iconAsset: "assets/images/svg/ic_search.svg",
            onActionClicked: onSearchActionTapped),
        PSTopAppBarAction(
            iconAsset: "assets/images/svg/ic_heart.svg",
            onActionClicked: onFavoriteActionTapped),
        PSTopAppBarAction(
            iconAsset: "assets/images/svg/ic_question_mark.svg",
            onActionClicked: onFAQActionTapped),
      ],
    );
  }

  factory PSTopAppBar.rewardDetail(
      {required OnShareActionTapped onShareActionTapped,
      required OnFavoriteActionTapped onFavoriteActionTapped,
      required OnBackTapped onBackTapped}) {
    return PSTopAppBar(
      showBackButton: true,
      topAppBarStyle: PSTopAppBarStyle.normal,
      onBackTapped: onBackTapped,
      actions: [
        PSTopAppBarAction(
            iconAsset: "assets/images/svg/ic_share.svg",
            onActionClicked: onShareActionTapped),
        PSTopAppBarAction(
            iconAsset: "assets/images/svg/ic_heart.svg",
            onActionClicked: onFavoriteActionTapped),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: topAppBarStyle.backgroundColor,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
          right: 24.0.w,
          top: 12.0.h,
          bottom: 12.0.h,
          left: !showBackButton ? 24.0.w : 16.0.w),
      child: AppBar(
        toolbarHeight: preferredSize.height,
        toolbarOpacity: 0.0,
        primary: true,
        backgroundColor: topAppBarStyle.backgroundColor,
        systemOverlayStyle: systemUiOverlayStyle,
        leading: _buildLeadingWidget(context),
        leadingWidth: !showBackButton ? 200.w : null,
        automaticallyImplyLeading: false,
        actions: [_buildActions()],
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        bottomOpacity: 0.0,
        shadowColor: Colors.transparent,
      ),
    );
  }

  Widget _buildActions() {
    return Wrap(
      spacing: 4.0.w,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children:
          actions?.map((action) => _buildActionButton(action)).toList() ?? [],
    );
  }

  Widget _buildActionButton(PSTopAppBarAction action) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: action.onActionClicked,
      child: Container(
        width: 36.r,
        height: 36.r,
        child: Center(
          child: SvgPicture.asset(
            action.iconAsset,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  Widget? _buildLeadingWidget(BuildContext context) {
    if (showBackButton) {
      return _buildActionButton(
        PSTopAppBarAction(
          iconAsset: "assets/images/svg/ic_back.svg",
          onActionClicked: () => onBackTapped?.call(),
        ),
      );
    } else {
      if (title != null && title!.isNotEmpty) {
        return Align(
            alignment: Alignment.centerLeft,
            child: PSText.topAppBarTitle(
              title!,
            ));
      }
    }
    return null;
  }
}

class PSTopAppBarAction {
  final String iconAsset;
  final void Function() onActionClicked;

  const PSTopAppBarAction({
    required this.iconAsset,
    required this.onActionClicked,
  });
}

enum PSTopAppBarStyle {
  normal(SoloerColors.background),
  transparent(Colors.transparent);

  final Color backgroundColor;

  const PSTopAppBarStyle(this.backgroundColor);
}
