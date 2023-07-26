import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class ButtonWidget extends StatefulWidget {
  double? width;
  double? height;
  Color? backgroundColor;
  String? textButton;
  Color? textColor;
  double? spaceBetweenCharacter;
  Function() clickButtonCallBack;
  double? fontSize;
  FontWeight? fontWeight;
  BorderRadius? borderRadius;

  // default color Border is Black Color
  final double? borderWidth;
  final Color? borderColor;
  //double? borderRadius;

  // Using When need Add a Image
  String? strImage;

  ButtonWidget(
      {required this.textButton,
      required this.clickButtonCallBack,
      required this.backgroundColor,
      this.spaceBetweenCharacter,
      this.width,
      this.height,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.borderWidth,
      this.borderColor,
      this.borderRadius,
      this.strImage});

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.clickButtonCallBack();
      },
      child: Container(
          decoration: setBoxDecoration(),
          width: widget.width == null ? double.infinity : widget.width,
          height: widget.height == null ? 42.0 : widget.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.textButton!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.textColor == null
                      ? Colors.white
                      : widget.textColor,
                  letterSpacing: widget.spaceBetweenCharacter == null
                      ? 0
                      : widget.spaceBetweenCharacter,
                  fontSize: widget.fontSize == null
                      ? DimenFont.sp25
                      : widget.fontSize,
                  fontWeight: widget.fontWeight == null
                      ? FontWeight.w600
                      : widget.fontWeight!,
                  fontFamily: 'ProductSansRegular',
                ),
              ),
            ],
          )),
    );
  }

  BoxDecoration setBoxDecoration() {
    return BoxDecoration(
      color: widget.backgroundColor,
      borderRadius: widget.borderRadius == null
          ? BorderRadius.circular(5.0)
          : widget.borderRadius,
      border: Border.all(
          width: widget.borderWidth == null ? 0 : widget.borderWidth!,
          color: widget.borderColor ?? widget.backgroundColor!),
    );
  }
}
