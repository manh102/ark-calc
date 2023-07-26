import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ark_calc/core/extensions/iterable_extension.dart';
import 'package:new_ark_calc/core/extensions/optional_extension.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/widgets/common/buttons/filled_button.dart';

import '../common/text_widget.dart';

typedef OnApplied = void Function(Set<int> checkedIndexes);

class PSCheckBoxListTile extends StatefulWidget {
  final List<String> data;
  final Set<int> checkedIndexes;
  final String title;
  final OnApplied onApplied;

  /// Example: %length% categories selected
  final String footerPattern;
  final bool searchBarEnabled;
  final String searchBarHint;

  PSCheckBoxListTile(
      {Key? key,
      required this.data,
      Set<int>? checkedIndexes,
      required this.title,
      required this.onApplied,
      required this.footerPattern,
      this.searchBarEnabled = false,
      this.searchBarHint = "Search for..."})
      : this.checkedIndexes = checkedIndexes ?? {},
        super(key: key);

  @override
  State<PSCheckBoxListTile> createState() => _PSCheckBoxListTileState();
}

class _PSCheckBoxListTileState extends State<PSCheckBoxListTile> {
  Set<int> checkedIndexes = {};
  TextEditingController searchController = TextEditingController();
  List<String> dataList = [];
  List<String> searchedList = [];
  FocusNode searchInputFocusNode = FocusNode();

  @override
  void initState() {
    checkedIndexes = widget.checkedIndexes;

    dataList = widget.data;
    searchedList = dataList;

    searchController.addListener(() {
      _onSearchInputChanged(searchController.text);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => searchInputFocusNode.unfocus(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(widget.title),
          Visibility(
              visible: widget.searchBarEnabled,
              child: Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: _buildSearchBar(),
              )),
          Expanded(
              flex: dataList.length.clamp(6, 11),
              child: Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: _buildCheckboxList(searchedList),
              )),
          Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: _buildApplyButton(),
          ),
          Visibility(
            visible: checkedIndexes.length > 0,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: _buildFooter(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    Widget _buildTitle() => PSText.bottomSheetTitle(title);

    Widget _buildClearAllButton() => GestureDetector(
          onTap: () {
            checkedIndexes.clear();
            searchController.clear();
            searchInputFocusNode.unfocus();
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
            widget.onApplied.call(checkedIndexes);
          },
        ),
      );

  Widget _buildFooter() {
    String footer = widget.footerPattern
        .replaceAll("%length%", checkedIndexes.length.toString());

    return Align(
      alignment: Alignment.center,
      child: PSText.normalText(footer,
          textStyle:
              PSStyle.t11R.copyWith(height: 1.6, color: SoloerColors.grey4)),
    );
  }

  Widget _buildCheckboxList(List<String> dataList) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: dataList.mapList((source) {
          final index = dataList.indexOf(source);
          return _buildListTile(source, index);
        }),
      ),
    );
  }

  Widget _buildListTile(String data, int index) {
    final title = PSText.checkboxTitle(data);
    return Column(
      children: [
        CheckboxListTile(
          value: checkedIndexes.any((element) => element == index),
          title: title,
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
          selected: true,
          checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.r),
              side: BorderSide(
                width: 5.r,
                color: Colors.black,
              )),
          checkColor: SoloerColors.checkboxIndicator,
          activeColor: SoloerColors.checkboxColor,
          onChanged: (value) {
            final isChecked = value.orDefault;
            isChecked
                ? checkedIndexes.add(index)
                : checkedIndexes.remove(index);
            setState(() {});
          },
        ),
        index != (widget.data.length - 1)
            ? Divider(
                thickness: 0.8,
              )
            : SizedBox(),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      focusNode: searchInputFocusNode,
      controller: searchController,
      style: PSStyle.t14L.copyWith(
        height: 1.6,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 12.0.w),
          child: SvgPicture.asset(
            "assets/images/svg/ic_search.svg",
            color: Color(0xFFB3B3B3),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(PSSpacing.searchInputRadius),
          borderSide: BorderSide(
            width: 0.5.r,
            color: SoloerColors.primaryText,
          ),
        ),
        hintText: widget.searchBarHint,
      ),
      onChanged: (input) {
        _onSearchInputChanged(input);
      },
    );
  }

  void _onSearchInputChanged(String input) {
    if (input.isEmpty) {
      searchedList = dataList;
    } else {
      searchedList = dataList
          .where(
              (element) => element.toLowerCase().contains(input.toLowerCase()))
          .toList();
    }
    setState(() {});
  }
}

class CheckBoxData {
  final String data;
  final bool isChecked;

  const CheckBoxData({
    required this.data,
    required this.isChecked,
  });
}

class CheckBoxListTileData {
  final List<String> items;
  final Set<int> checkedIndexes;
  final String title;
  final OnApplied onApplied;

  /// Example: %length% categories selected
  final String footerPattern;
  final bool searchBarEnabled;
  final String searchBarHint;

  const CheckBoxListTileData(
      {required this.items,
      required this.checkedIndexes,
      required this.title,
      required this.onApplied,
      required this.footerPattern,
      this.searchBarEnabled = false,
      this.searchBarHint = ""});
}
