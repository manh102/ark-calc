import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/widgets/common/cards/list_widget.dart';
import 'package:new_ark_calc/core/widgets/common/chips/filter_chip.dart';

class MultipleSelectableChipList extends StatefulWidget {
  MultipleSelectableChipList(
      {Key? key,
      required this.items,
      this.controller,
      required this.selected,
      required this.onSelectionChanged,
      this.onTap,
      double? betweenItemSpace,
      double? paddingSpace})
      : this.betweenItemSpace = betweenItemSpace ?? 12.0.w,
        this.paddingSpace = paddingSpace ?? PSSpacing.horizontalMargin,
        super(key: key);

  /// Descriptions of the [FilterChip] in the [MultipleSelectableChipList].
  ///
  /// This a required parameter and must contain at least one item
  final List<FilterChipData> items;

  /// The set of [PSFilterChip]s that indicate which [chips] are
  /// selected.
  ///
  /// As the [PSFilterChip] does not maintain the state of the selection,
  /// you will need to update this in response to [onSelectionChanged] calls.
  ///
  /// This is a required parameter.
  final Set<int> selected;

  /// The function that is called when the selection changes.
  ///
  /// The callback's parameter indicates which of the chips are selected.
  ///
  final void Function(Set<int> selectedIndexes) onSelectionChanged;

  /// Controls a scrollable widget.
  final ScrollController? controller;

  /// Space between items of [MultipleSelectableChipList].
  final double betweenItemSpace;

  /// Horizontal padding of the [MultipleSelectableChipList]
  final double paddingSpace;

  /// An OnTap CallBack for each item of [MultipleSelectableChipList]
  final void Function(int index)? onTap;

  @override
  State<MultipleSelectableChipList> createState() =>
      _MultipleSelectableChipListState();
}

class _MultipleSelectableChipListState
    extends State<MultipleSelectableChipList> {
  Set<int> _selectedIndexes = {};

  @override
  void initState() {
    this._selectedIndexes = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var labels = widget.items.map((e) => e.label).toList();

    return PSListViewWidget<String>(
      items: labels,
      itemBuilder: (item) {
        int index = labels.indexOf(item);
        final leadingIcon = widget.items[index].leadingIcon;
        final selected = widget.selected.contains(index);
        final showTrailingIcon = widget.items[index].showTrailingIcon;
        return IntrinsicWidth(
          child: PSFilterChip(
            label: item,
            leadingIcon: leadingIcon,
            selected: selected,
            isShowTrailingIcon: showTrailingIcon,
            onSelected: (isSelected) {
              widget.onTap?.call(index);
            },
          ),
        );
      },
      onTap: (index) => widget.onTap?.call(index),
      betweenItemSpace: widget.betweenItemSpace,
      paddingSpace: widget.paddingSpace,
      scrollDirection: Axis.horizontal,
      controller: widget.controller,
    );
  }
}
