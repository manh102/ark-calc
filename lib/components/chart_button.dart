import 'package:arklevelcalculator/entities/operator.dart';
import 'package:flutter/material.dart';

typedef StringValue = void Function(String);

class CharButton extends StatelessWidget {
  final String characterName;
  StringValue callback;

  CharButton(this.callback, {this.characterName});

  @override
  Widget build(BuildContext context) {
    return Material(
      // needed
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          callback(characterName);
        }, // needed
        child: Image.asset(
          "assets/images/${characterName}.png",
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
