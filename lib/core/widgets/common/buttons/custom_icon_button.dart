import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_ark_calc/core/util/image_type_enum.dart';

class PSIconButton extends IconButton {
  static const double _defaultIconSize = 24.0;

  PSIconButton({
    required super.onPressed,
    required super.icon,
    super.iconSize,
    super.padding,
    super.splashColor,
    super.hoverColor,
    super.splashRadius,
    super.color,
  });

  factory PSIconButton.create({
    required void Function()? onPressed,
    required String iconAsset,
    Color? iconColor,
    double size = _defaultIconSize,
    EdgeInsetsGeometry? padding,
    double? extraSplashRadius,
    bool isShowSplashRadius = true,
  }) {
    double calculateSplashRadius(double size) {
      return size + (extraSplashRadius ?? 5).r;
    }

    return PSIconButton(
      onPressed: onPressed,
      icon: iconAsset.getImageWidget(width: size.r, height: size.r),
      iconSize: size.r,
      padding: padding,
      color: iconColor,
      splashRadius: isShowSplashRadius ? calculateSplashRadius(size) : null,
    );
  }
}

class PSDenseIconButton extends StatelessWidget {
  static const double _defaultIconSize = 12.0;

  final String asset;
  final Size size;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final Color? iconColor;

  PSDenseIconButton(this.asset,
      {double? size, this.onPressed, this.padding, this.iconColor})
      : this.size = Size.fromRadius(size ?? _defaultIconSize.r);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: onPressed,
      child: Container(
        width: size.width,
        height: size.height,
        padding: padding ?? EdgeInsets.all(6.w),
        child: SvgPicture.asset(
          asset,
          color: iconColor,
        ),
      ),
    );
  }
}
