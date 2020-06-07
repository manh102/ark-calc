import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';

class ResultRow extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;

  ResultRow({this.leftTitle, this.rightTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              leftTitle,
              textAlign: TextAlign.right,
              style: kLabelTextStyle,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              rightTitle,
              style: kContentTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
