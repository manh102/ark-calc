import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ark_calc/core/navigation/app_routes.dart';
import 'package:new_ark_calc/core/widgets/common/buttons/custom_icon_button.dart';

import '../../../../core/resources/colors.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/resources/spacings.dart';
import '../../../../core/resources/text_styles.dart';
import '../../../../core/widgets/common/buttons/filled_button.dart';
import '../../../../core/widgets/common/soloer_text_widget.dart';
import '../../../../core/widgets/common/text_widget.dart';

mixin SignInWidgetsMixin {
  Widget buildButtonSkip({
    required BuildContext context,
  }) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: InkWell(
          onTap: () {
            context.goNamed(AppRoutes.homeTab.namedRoute,
                extra: {"isLoggedIn": false});
          },
          child: Container(
            width: 60.0,
            height: 20.0,
            child: TextWidget(
                textButton: 'SKIP'.tr(),
                fontSize: DimenFont.sp14,
                textColor: SoloerColors.color_0c1b1e),
          ),
        ));
  }

  Widget buildBodyContainer(List<Widget> children) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: BoxDecoration(
        color: SoloerColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(PSSpacing.signInCardRadius),
          topRight: Radius.circular(PSSpacing.signInCardRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget buildThumbnail(String thumbnailAsset) {
    return SvgPicture.asset(
      thumbnailAsset,
      width: 192.w,
      height: 176.h,
    );
  }

  Widget buildTitle(String title) {
    return PSText.text(
      title,
      textAlign: TextAlign.center,
      textStyle: PSStyle.t24R.copyWith(
          height: 1.6,
          color: SoloerColors.primaryText,
          fontWeight: FontWeight.w400),
    );
  }

  Widget buildSubTitle(String subtitle, {double padding = 15}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      alignment: Alignment.center,
      child: PSText.text(
        subtitle,
        textStyle: PSStyle.t14L.copyWith(
            height: 1.6,
            color: SoloerColors.primaryText,
            fontWeight: FontWeight.w300),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildBottomButton(
      {required String label, required void Function() onPressed}) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.only(
          left: PSSpacing.horizontalMargin,
          right: PSSpacing.horizontalMargin,
          bottom: PSSpacing.betweenItemSpace),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PSFilledButton.normal(
            label: label,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  Widget _buildCloseButton({required void Function()? onPressed}) {
    return PSIconButton.create(
      onPressed: onPressed,
      iconAsset: "assets/images/svg/ic_close.svg",
      size: 20.r,
    );
  }
}
