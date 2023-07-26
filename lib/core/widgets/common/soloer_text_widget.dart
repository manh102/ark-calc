import 'package:flutter/material.dart';
import 'package:new_ark_calc/core/resources/resources.dart';

class TextWidget extends StatefulWidget {
  String? textButton;
  Color? textColor;
  double? spaceBetweenCharacter;
  double? fontSize;
  FontWeight? fontWeight;
  String? fontFamily;
  TextDecoration? textDecoration;
  bool? hasUnderLine;
  Alignment? alignment;
  TextAlign? alignText;
  int maxLines;

  TextWidget(
      {required this.textButton,
      this.textColor,
      this.textDecoration,
      this.spaceBetweenCharacter,
      this.fontWeight,
      this.alignText = TextAlign.center,
      this.fontFamily,
      this.fontSize,
      this.hasUnderLine,
      this.alignment,
      this.maxLines = 100});

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          widget.alignment != null ? widget.alignment : Alignment.centerLeft,
      decoration: widget.hasUnderLine == true
          ? BoxDecoration(
              border: Border(
                  bottom: BorderSide(
              //                   <--- left side
              color: Colors.black,
              width: 1.0,
            )))
          : BoxDecoration(),
      child: Padding(
        padding: widget.hasUnderLine == true
            ? const EdgeInsets.only(bottom: 5.0)
            : const EdgeInsets.only(bottom: 0.0),
        child: Text(
          widget.textButton!,
          maxLines: widget.maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: widget.alignText,
          style: TextStyle(
            decoration: widget.textDecoration == null
                ? TextDecoration.none
                : widget.textDecoration,
            color: widget.textColor == null
                ? SoloerColors.color_0c1b1e
                : widget.textColor,
            letterSpacing: widget.spaceBetweenCharacter == null
                ? 0
                : widget.spaceBetweenCharacter,
            fontSize:
                widget.fontSize == null ? DimenFont.sp12 : widget.fontSize,
            fontWeight: widget.fontWeight == null
                ? FontWeight.w600
                : widget.fontWeight!,
            fontFamily: widget.fontFamily != null
                ? widget.fontFamily
                : 'ProductSansRegular',
          ),
        ),
      ),
    );
  }
}
