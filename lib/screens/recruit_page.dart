import 'dart:math';

import 'package:arklevelcalculator/Repositories/cake_repository.dart';
import 'package:arklevelcalculator/entities/cake.dart';
import 'package:arklevelcalculator/recruit_calculate.dart';
import 'package:arklevelcalculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';
import 'package:arklevelcalculator/components/reusabke_square_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:arklevelcalculator/components/icon_content.dart';
import 'package:arklevelcalculator/components/chart_button.dart';
import 'package:get_it/get_it.dart';

class RecruitPage extends StatefulWidget {
  @override
  _RecruitPage createState() => _RecruitPage();
}

class _RecruitPage extends State<RecruitPage> {
  CakeRepository _cakeRepository = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RECRUITMENT CALCULATOR'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Table(
            border: TableBorder.all(
                color: Colors.white30, width: 1, style: BorderStyle.solid),
            columnWidths: {
              0: FractionColumnWidth(.1),
              1: FractionColumnWidth(.6)
            },
            children: [
              // Row 1
              TableRow(children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      'Qualification',
                      style: kRecruitTitle,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Wrap(
                      spacing: 1.0,
                      children: <Widget>[
                        RaisedButton(
                          child: const Text('Starter'),
                          onPressed: () {
                            print('Tapped on Starter Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Senior Operator'),
                          onPressed: () {
                            print('Tapped on Senior Operator Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Top Operator'),
                          onPressed: () {
                            print('Tapped on Top Operator Button');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              // Row 2
              TableRow(children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      'Position',
                      style: kRecruitTitle,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Wrap(
                      spacing: 1.0,
                      children: <Widget>[
                        RaisedButton(
                          child: const Text('Melee'),
                          onPressed: () {
                            print('Tapped on Melee Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Ranged'),
                          onPressed: () {
                            print('Tapped on Ranged Button');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              // Row 3
              TableRow(children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      'Class',
                      style: kRecruitTitle,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Wrap(
                      spacing: 1.0,
                      children: <Widget>[
                        RaisedButton(
                          child: const Text('Guard'),
                          onPressed: () {
                            print('Tapped on Guard Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Medic'),
                          onPressed: () {
                            print('Tapped on Medic Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Vanguard'),
                          onPressed: () {
                            print('Tapped on Vanguard Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Caster'),
                          onPressed: () {
                            print('Tapped on Caster Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Sniper'),
                          onPressed: () {
                            print('Tapped on Sniper Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Defender'),
                          onPressed: () {
                            print('Tapped on Defender Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Supporter'),
                          onPressed: () {
                            print('Tapped on Supporter Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Specialist'),
                          onPressed: () {
                            print('Tapped on Specialist Button');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              // Row 4
              TableRow(children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      'Affix',
                      style: kRecruitTitle,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Wrap(
                      spacing: 1.0,
                      children: <Widget>[
                        RaisedButton(
                          child: const Text('Healing'),
                          onPressed: () {
                            print('Tapped on Healing Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Support'),
                          onPressed: () {
                            print('Tapped on Support Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('DPS'),
                          onPressed: () {
                            print('Tapped on DPS Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('AOE'),
                          onPressed: () {
                            print('Tapped on AOE Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Slow'),
                          onPressed: () {
                            print('Tapped on Slow Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Survival'),
                          onPressed: () {
                            print('Tapped on Survival Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Defense'),
                          onPressed: () {
                            print('Tapped on Defense Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Debuff'),
                          onPressed: () {
                            print('Tapped on Debuff Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Shift'),
                          onPressed: () {
                            print('Tapped on Shift Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Crowd Control'),
                          onPressed: () {
                            print('Tapped on Crowd Control Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Nuker'),
                          onPressed: () {
                            print('Tapped on Nuker Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Summon'),
                          onPressed: () {
                            print('Tapped on Summon Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Fast-Redeploy'),
                          onPressed: () {
                            print('Tapped on Fast-Redeploy Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('DP-Recovery'),
                          onPressed: () {
                            print('Tapped on DP-Recovery Button');
                          },
                        ),
                        RaisedButton(
                          child: const Text('Robot'),
                          onPressed: () {
                            print('Tapped on Robot Button');

                            _addCake();

                            // TEST
                            RecruitCalculate calc =
                                RecruitCalculate(tags: [RecruitTag.Robot]);
                            print(calc.getPossibleNames()[1]);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
          SizedBox(height: 30.0),
          Table(
            border: TableBorder.all(
                color: Colors.white30, width: 1, style: BorderStyle.solid),
            columnWidths: {
              0: FractionColumnWidth(.05),
              1: FractionColumnWidth(.2),
              2: FractionColumnWidth(.6)
            },
            children: [
              TableRow(children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      '#',
                      style: kLabelTextStyle,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      'Tags',
                      style: kLabelTextStyle,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      'Character Possibility',
                      style: kLabelTextStyle,
                    ),
                  ),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      '1',
                      style: kRecruitTitle,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      'Top Operator',
                      style: kRecruitTitle,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Wrap(
                      spacing: 1.0,
                      children: <Widget>[
                        CharButton(
                          characterName: 'Siege',
                        ),
                        CharButton(
                          characterName: 'Texas',
                        ),
                        CharButton(
                          characterName: 'Shining',
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  _loadCakes() async {
    final cakes = await _cakeRepository.getAllCakes();
    print('loaded');
    print(cakes[0].name);
  }

  _addCake() async {
    final list = ["apple", "orange", "chocolate"]..shuffle();
    final name = "My yummy ${list.first} cake";
    final yummyness = Random().nextInt(10);
    final newCake = Cake(name: name, yummyness: yummyness);
    await _cakeRepository.insertCake(newCake);
    _loadCakes();
  }
}
