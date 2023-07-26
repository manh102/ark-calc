import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ark_calc/core/extensions/iterable_extension.dart';
import 'package:new_ark_calc/core/extensions/optional_extension.dart';
import 'package:new_ark_calc/core/resources/colors.dart';
import 'package:new_ark_calc/core/widgets/common/buttons/filled_button.dart';

import '../../resources/text_styles.dart';
import '../common/text_widget.dart';

typedef OnApplied = void Function(int checkedIndex);

class PSRadioListTile extends StatefulWidget {
  final List<String> items;
  final int initSelectedIndex;
  final String title;
  final OnApplied onApplied;

  const PSRadioListTile({
    Key? key,
    required this.items,
    this.initSelectedIndex = 0,
    required this.title,
    required this.onApplied,
  }) : super(key: key);

  @override
  State<PSRadioListTile> createState() => _PSRadioListTileState();
}

class _PSRadioListTileState extends State<PSRadioListTile> {
  int checkedIndex = 0;

  @override
  void initState() {
    checkedIndex = widget.initSelectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(widget.title),
        24.verticalSpace,
        _buildRadioList(widget.items),
        24.verticalSpace,
        _buildApplyButton(),
      ],
    );
  }

  Widget _buildHeader(String title) {
    Widget _buildTitle() => PSText.bottomSheetTitle(title);

    Widget _buildClearAllButton() => GestureDetector(
          onTap: () {
            checkedIndex = -1;
            setState(() {});
          },
          child: PSText.sectionSubTitle("Clear all",
              color: Color(0xFF8F85FF),
              textStyle: PSStyle.t14B
                  .copyWith(height: 1.6, decoration: TextDecoration.underline),
              fontWeight: FontWeight.w400),
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Expanded(child: _buildTitle()), _buildClearAllButton()],
    );
  }

  Widget _buildApplyButton() => Container(
        width: 1.sw,
        child: PSFilledButton.normal(
          label: "Apply",
          onPressed: () {
            GoRouter.of(context).pop();
            widget.onApplied.call(checkedIndex);
          },
        ),
      );

  Widget _buildRadioList(List<String> dataList) {
    return Column(
      children: dataList.mapList((source) {
        final index = dataList.indexOf(source);
        return _buildListTile(source, index);
      }),
    );
  }

  Widget _buildListTile(String data, int index) {
    final title = PSText.checkboxTitle(data);

    return Column(
      children: [
        RadioListTile<int>(
          value: index,
          groupValue: checkedIndex,
          onChanged: (value) {
            setState(() {
              checkedIndex = value.orDefault;
            });
          },
          title: title,
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
          activeColor: SoloerColors.checkboxColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        index != (widget.items.length - 1)
            ? Divider(
                thickness: 0.8,
              )
            : SizedBox(),
      ],
    );
  }
}

class RadioListTileData {
  final List<String> data;
  final int initSelectedIndex;
  final String title;
  final OnApplied onApplied;

  const RadioListTileData({
    required this.data,
    required this.title,
    this.initSelectedIndex = 0,
    required this.onApplied,
  });
}
