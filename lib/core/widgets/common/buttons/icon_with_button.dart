import 'package:flutter/material.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/util/image_type_enum.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';

class IconWithButton extends StatelessWidget {
  final String label;
  final String icon;
  final bool isIconLeading;
  final Function() onTapped;

  const IconWithButton(
      {Key? key,
      required this.label,
      required this.icon,
      this.isIconLeading = false,
      required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconWidget = icon.getImageWidget();
    final textWidget = PSText.button(
      label,
      textStyle: PSStyle.t10L,
      color: SoloerColors.primary,
    );
    return TextButton.icon(
      onPressed: () {},
      icon: isIconLeading ? iconWidget : textWidget,
      label: isIconLeading ? textWidget : iconWidget,
    );
  }
}
