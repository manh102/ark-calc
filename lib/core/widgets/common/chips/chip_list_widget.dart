import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/widgets/common/cards/list_widget.dart';
import 'package:new_ark_calc/core/widgets/common/chips/filled_chip.dart';

typedef OnSelectedChip = void Function(int index);

class SelectableChipListWidget extends StatefulWidget {
  final List<String> items;
  final int selectedIndex;
  final OnSelectedChip onSelectedChip;
  final ScrollController? controller;

  const SelectableChipListWidget(
      {Key? key,
      required this.items,
      required this.selectedIndex,
      required this.onSelectedChip,
      this.controller})
      : super(key: key);

  @override
  State<SelectableChipListWidget> createState() =>
      _SelectableChipListWidgetState();
}

class _SelectableChipListWidgetState extends State<SelectableChipListWidget> {
  @override
  Widget build(BuildContext context) {
    return PSListViewWidget<String>(
      items: widget.items,
      itemBuilder: (item) {
        int index = widget.items.indexOf(item);
        var chipStyle = PSChipStyle.unselected();
        if (index == widget.selectedIndex) {
          chipStyle = PSChipStyle.selected();
        }
        return PSFilledChip(
          label: widget.items[index],
          onTapped: () => widget.onSelectedChip(index),
          backgroundColor: chipStyle.backgroundColor,
          labelColor: chipStyle.labelColor,
          padding: PSSpacing.selectedChipPadding,
          labelStyle: PSStyle.t8L,
        );
      },
      onTap: (index) {},
      betweenItemSpace: 8.w,
      paddingSpace: PSSpacing.horizontalMargin,
      scrollDirection: Axis.horizontal,
      controller: widget.controller,
    );
  }
}
