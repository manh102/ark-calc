import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//typedef IntValue = int Function(int);
typedef IntValue = void Function(int);

class ReusableDropdownButton extends StatefulWidget {
  @override
  _ReusableDropdownButtonState createState() => _ReusableDropdownButtonState();
  IntValue callback;
  var dropdownValues = <String>[];
  ReusableDropdownButton(this.callback, {this.dropdownValues});
}

class _ReusableDropdownButtonState extends State<ReusableDropdownButton> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.dropdownValues[selectedIndex],
        icon: Icon(FontAwesomeIcons.arrowDown),
        iconSize: 24,
        elevation: 16,
        style: kContentTextStyle,
        onChanged: (String newValue) {
          setState(() {
            selectedIndex = widget.dropdownValues.indexOf(newValue);
            widget.callback(selectedIndex);
          });
        },
        items:
            widget.dropdownValues.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
