import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colors.dart';
import 'custom_icon_button.dart';

class PSFavoriteButton extends StatefulWidget {
  final bool initialValue;
  final Function(bool isLiked) onClickedListener;

  const PSFavoriteButton(
      {Key? key, required this.initialValue, required this.onClickedListener})
      : super(key: key);

  @override
  _PSFavoriteButtonState createState() => _PSFavoriteButtonState();
}

class _PSFavoriteButtonState extends State<PSFavoriteButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _touchAnimation;

  bool _isChecked = false;

  bool _isLongPress = false;

  void animate() {
    _animationController.forward();

    setState(() {
      _isChecked = !_isChecked;
      widget.onClickedListener(_isChecked);
    });
  }

  void longPressAnimate(bool isStart) {
    if (isStart) {
      setState(() {
        _isLongPress = true;
      });
      _animationController.forward();
    } else {
      _animationController.reverse();

      setState(() {
        _isChecked = !_isChecked;
        _isLongPress = false;
        widget.onClickedListener(_isChecked);
      });
    }
  }

  @override
  void initState() {
    setState(() {
      _isChecked = widget.initialValue;
    });

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _touchAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeIn,
            reverseCurve: Curves.easeOut));

    _touchAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_isLongPress) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed && !_isLongPress) {
        _animationController.stop();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPressStart: (details) => longPressAnimate(true),
        onLongPressEnd: (details) => longPressAnimate(false),
        onLongPress: Feedback.wrapForLongPress(() {}, context),
        child: ScaleTransition(
          scale: _touchAnimation,
          child: !_isChecked
              ? PSDenseIconButton(
                  "assets/images/svg/ic_heart.svg",
                  size: 14.r,
                  onPressed: () =>
                      Feedback.wrapForTap(animate, context)?.call(),
                  iconColor: SoloerColors.favoriteButtonBorder,
                )
              : PSDenseIconButton(
                  "assets/images/svg/ic_filled_heart.svg",
                  size: 14.r,
                  onPressed: () =>
                      Feedback.wrapForTap(animate, context)?.call(),
                  iconColor: SoloerColors.progressIndicator,
                ),
        ));
  }
}
