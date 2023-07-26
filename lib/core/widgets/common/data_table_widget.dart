import 'package:flutter/material.dart';
import 'package:new_ark_calc/core/extensions/iterable_extension.dart';
import 'package:new_ark_calc/core/resources/gaps.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';

class PSDataTable extends StatelessWidget {
  final int row;
  final List<RowItem> items;

  PSDataTable({
    Key? key,
    this.row = 1,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<List<RowItem>> pairs =
        items.chunked(row).map((chunk) => chunk.toList()).toList();

    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: pairs
            .map((pair) =>
                Flexible(child: _buildItemRow(pair, pairs.last == pair)))
            .toList(),
      ),
    );
  }

  Widget _buildItemRow(List<RowItem> pair, bool lastIndex) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: !lastIndex ? PSSpacing.dataTablePadding.bottom : 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: pair.map((item) => _buildDataItem(item)).toList(),
      ),
    );
  }

  Widget _buildDataItem(RowItem rowItem) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: _buildDataItemLabel(rowItem.label)),
        gapH8,
        Flexible(child: _buildDataItemValue(rowItem.value))
      ],
    ));
  }

  Widget _buildDataItemLabel(String label) {
    return PSText.dataTableLabel(label);
  }

  Widget _buildDataItemValue(dynamic value) {
    if (value is String) {
      return PSText.dataTableValue(value);
    } else if (value is Widget) {
      return value;
    } else {
      return SizedBox();
    }
  }
}

class RowItem {
  final String label;
  final dynamic value;

  RowItem(this.label, this.value);
}
