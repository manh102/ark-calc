import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.colour, this.cardChild, this.onPress, this.title});

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      margin: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: kLabelTextStyle,
          ),
          Expanded(
            child: Container(
              child: cardChild,
              decoration: BoxDecoration(
                color: colour,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
