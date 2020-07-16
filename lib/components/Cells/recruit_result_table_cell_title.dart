import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';

class RecruitTableCellTitle extends StatelessWidget {
  final String text;

  RecruitTableCellTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Text(
          text,
          style: kRecruitTitle,
        ),
      ),
    );
  }
}
