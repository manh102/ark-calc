import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';

class RecruitTableCellNumber extends StatelessWidget {
  final String text;

  RecruitTableCellNumber({this.text});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Center(
        child: Text(
          text,
          style: kRecruitTitle,
        ),
      ),
    );
  }
}
