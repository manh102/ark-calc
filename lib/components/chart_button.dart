import 'package:flutter/material.dart';

class CharButton extends StatelessWidget {
  final String characterName;

  CharButton({this.characterName});

  @override
  Widget build(BuildContext context) {
    return Material(
      // needed
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          print('SIEGE HEHE');
        }, // needed
        child: Image.asset(
          "assets/images/$characterName.png",
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
