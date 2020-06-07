import 'package:arklevelcalculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';
import 'package:arklevelcalculator/components/reusabke_square_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:arklevelcalculator/components/icon_content.dart';

enum Category {
  male,
  female,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Category selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARKNIGHTS CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableSquareCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Category.male;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InputPage(),
                          ),
                        );
                      });
                    },
                    colour: selectedGender == Category.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.bitcoin,
                      label: 'LEVEL UP COST',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableSquareCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Category.female;
                      });
                    },
                    colour: selectedGender == Category.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.drupal,
                      label: 'RECRUITMENT',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
