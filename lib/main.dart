import 'package:flutter/material.dart';
import 'package:arklevelcalculator/screens/home_page.dart';

import 'init.dart';

void main() => runApp(ARKLevelCalculator());

class ARKLevelCalculator extends StatefulWidget {
  @override
  _ARKLevelCalculatorState createState() => _ARKLevelCalculatorState();
}

class _ARKLevelCalculatorState extends State<ARKLevelCalculator> {
  final Future _init = Init.initialize();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          } else {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
