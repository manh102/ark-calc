import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../recruit_calculate.dart';

class RecruitTableCellTagDetail extends StatelessWidget {
  final List<String> tagList;
  RecruitTableCellTagDetail({this.tagList});
  RecruitCalculate recruitCalculate = RecruitCalculate();

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Wrap(
          spacing: 1.0,
          children: <Widget>[
            for (final tag in tagList)
              Text(
                recruitCalculate.convertTagName(tag) + " ",
                style: kResultTextStyle,
              ),
          ],
        ),
      ),
    );
  }
}
