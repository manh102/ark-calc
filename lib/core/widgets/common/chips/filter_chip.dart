import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/util/image_type_enum.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';

class PSFilterChip extends StatefulWidget {
  final String label;
  final String? leadingIcon;
  final bool selected;
  final bool isShowTrailingIcon;
  final void Function(bool isSelected)? onSelected;

  const PSFilterChip(
      {Key? key,
      required this.label,
      this.leadingIcon,
      this.isShowTrailingIcon = true,
      required this.selected,
      this.onSelected})
      : super(key: key);

  @override
  State<PSFilterChip> createState() => _PSFilterChipState();
}

class _PSFilterChipState extends State<PSFilterChip> {
  @override
  Widget build(BuildContext context) {
    final leadingWidget = widget.leadingIcon?.getImageWidget(height: 16.0);
    final chipWidget = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leadingWidget != null
            ? Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: leadingWidget,
              )
            : SizedBox(),
        Flexible(
            child: PSText.chip(
          widget.label,
          textOverflow: TextOverflow.visible,
          softWrap: false,
          textStyle: PSStyle.t12R,
        )),
        Visibility(
          visible: widget.isShowTrailingIcon,
          child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: "assets/images/svg/ic_chevron_down.svg"
                .getImageWidget(height: 16),
          ),
        )
      ],
    );

    return IntrinsicHeight(
      child: Material(
        color: widget.selected
            ? SoloerColors.selectedChipColor
            : Colors.transparent,
        shape: _buildCustomShape(),
        child: InkWell(
          onTap: () {
            widget.onSelected?.call(!widget.selected);
          },
          customBorder: _buildCustomShape(),
          child: Container(
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: Colors.transparent,
                shape: StadiumBorder(),
              ),
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
              child: chipWidget),
        ),
      ),
    );
  }

  ShapeBorder _buildCustomShape() => StadiumBorder(
      side: BorderSide(
          color: !widget.selected
              ? SoloerColors.unselectedChipBorderColor
              : Colors.transparent));
}

class FilterChipData {
  final String label;
  final String? leadingIcon;
  final bool showTrailingIcon;

  const FilterChipData({
    required this.label,
    this.leadingIcon,
    this.showTrailingIcon = true,
  });
}
