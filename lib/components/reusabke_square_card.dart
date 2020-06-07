import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';

class ReusableSquareCard extends StatelessWidget {
  ReusableSquareCard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(kContainerMargin),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(kRadius),
        ),
      ),
    );
  }
}
