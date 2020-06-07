import 'package:flutter/material.dart';

//typedef StringValue = String Function(String);
typedef StringValue = void Function(String);

class EnhancedTextfield extends StatelessWidget {
  StringValue callback;
  final String hintText;
  EnhancedTextfield(this.callback, {this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(10),
      ),
      keyboardType: TextInputType.number,
      onChanged: (text) {
        callback(text);
      },
    );
  }
}
