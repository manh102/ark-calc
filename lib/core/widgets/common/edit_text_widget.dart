import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/resources.dart';
import '../../constants/common_const.dart';

class EditTextWidget extends StatefulWidget {
  String hintText;
  TextEditingController textController;
  String? svgImage;
  bool? obscureText;
  int? type;
  EdgeInsets? padding;
  Color? textColor;
  double? spaceBetweenCharacter;
  double? fontSize;
  FontWeight? fontWeight;
  TextDecoration? textDecoration;
  FocusNode? focusNode;
  VoidCallback? onTapRightIcon;

  EditTextWidget(
      {required this.hintText,
      required this.textController,
      this.svgImage,
      this.obscureText,
      this.type,
      this.padding,
      this.textColor,
      this.spaceBetweenCharacter,
      this.fontSize,
      this.fontWeight,
      this.focusNode,
      this.onTapRightIcon});

  @override
  _EditTextWidgetState createState() => _EditTextWidgetState();
}

class _EditTextWidgetState extends State<EditTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding != null
          ? widget.padding!
          : const EdgeInsets.only(left: 0),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: widget.type == CommonConst.TYPE_EDIT
            ? BoxDecoration(border: Border())
            : BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                //                   <--- left side
                color: Colors.black12,
                width: 1.0,
              ))),
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextField(
                focusNode: widget.focusNode,
                controller: widget.textController,
                obscureText: widget.obscureText ?? false,
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
                  fontSize: widget.fontSize == null
                      ? DimenFont.sp12
                      : widget.fontSize,
                  fontWeight: widget.fontWeight == null
                      ? FontWeight.w600
                      : widget.fontWeight!,
                  fontFamily: 'ProductSansRegular',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                    top: widget.type == CommonConst.TYPE_EDIT ? 0.0 : 5.0,
                  ),
                  labelText: widget.hintText,
                  labelStyle: TextStyle(
                    color: SoloerColors.color_919191,
                    fontFamily: 'ProductSansRegular',
                  ),
                  suffixIcon: widget.svgImage != null
                      ? IconButton(
                          onPressed: widget.onTapRightIcon,
                          icon: widget.type != CommonConst.TYPE_EDIT
                              ? SvgPicture.asset(
                                  widget.svgImage!,
                                  height: 20.0,
                                )
                              : Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                      'assets/images/png/edit_ic.png'),
                                ),
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
