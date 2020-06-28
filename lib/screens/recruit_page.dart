import 'dart:ffi';

import 'package:arklevelcalculator/Repositories/operator_repository.dart';
import 'package:arklevelcalculator/components/chart_button.dart';
import 'package:arklevelcalculator/recruit_calculate.dart';
import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';
import 'package:get_it/get_it.dart';

class RecruitPage extends StatefulWidget {
  @override
  _RecruitPage createState() => _RecruitPage();
}

class _RecruitPage extends State<RecruitPage> {
  OperatorRepository _operatorRepository = GetIt.I.get();
  List<List<String>> totalList = [];
  List<String> listOperator1 = [];
  List<String> listOperator2 = [];
  List<String> listOperator3 = [];
  List<String> selectedTag = [];
  RecruitCalculate recruitCalculate = RecruitCalculate();

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
                            addTag("starter");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Senior Operator'),
                          onPressed: () {
                            print('Tapped on Senior Operator Button');
                            addTag("seniorOperator");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Top Operator'),
                          onPressed: () {
                            print('Tapped on Top Operator Button');
                            addTag("topOperator");
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
                            addTag("melee");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Ranged'),
                          onPressed: () {
                            print('Tapped on Ranged Button');
                            addTag("range");
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
                            addTag("guard");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Medic'),
                          onPressed: () {
                            print('Tapped on Medic Button');
                            addTag("medic");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Vanguard'),
                          onPressed: () {
                            print('Tapped on Vanguard Button');
                            addTag("vanguard");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Caster'),
                          onPressed: () {
                            print('Tapped on Caster Button');
                            addTag("caster");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Sniper'),
                          onPressed: () {
                            print('Tapped on Sniper Button');
                            addTag("sniper");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Defender'),
                          onPressed: () {
                            print('Tapped son Defender Button');
                            addTag("defender");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Supporter'),
                          onPressed: () {
                            print('Tapped on Supporter Button');
                            addTag("supporter");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Specialist'),
                          onPressed: () {
                            print('Tapped on Specialist Button');
                            addTag("specialist");
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
                            addTag("healing");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Support'),
                          onPressed: () {
                            print('Tapped on Support Button');
                            addTag("support");
                          },
                        ),
                        RaisedButton(
                          child: const Text('DPS'),
                          onPressed: () {
                            print('Tapped on DPS Button');
                            addTag("dPS");
                          },
                        ),
                        RaisedButton(
                          child: const Text('AOE'),
                          onPressed: () {
                            print('Tapped on AOE Button');
                            addTag("aOE");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Slow'),
                          onPressed: () {
                            print('Tapped on Slow Button');
                            addTag("slow");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Survival'),
                          onPressed: () {
                            print('Tapped on Survival Button');
                            addTag("survival");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Defense'),
                          onPressed: () {
                            print('Tapped on Defense Button');
                            addTag("defense");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Debuff'),
                          onPressed: () {
                            print('Tapped on Debuff Button');
                            addTag("debuff");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Shift'),
                          onPressed: () {
                            print('Tapped on Shift Button');
                            addTag("shift");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Crowd Control'),
                          onPressed: () {
                            print('Tapped on Crowd Control Button');
                            addTag("crowdControl");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Nuker'),
                          onPressed: () {
                            print('Tapped on Nuker Button');
                            addTag("nuker");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Summon'),
                          onPressed: () {
                            print('Tapped on Summon Button');
                            addTag("summon");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Fast-Redeploy'),
                          onPressed: () {
                            print('Tapped on Fast-Redeploy Button');
                            addTag("fastRedeploy");
                          },
                        ),
                        RaisedButton(
                          child: const Text('DP-Recovery'),
                          onPressed: () {
                            print('Tapped on DP-Recovery Button');
                            addTag("dPRecovery");
                          },
                        ),
                        RaisedButton(
                          child: const Text('Robot'),
                          onPressed: () {
                            print('Tapped on Robot Button');
                            addTag("robot");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
          FlatButton(
            child: Container(
              height: 30.0,
              width: double.infinity,
              color: Colors.redAccent,
              child: Center(
                child: Text(
                  "Clear all tags",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onPressed: () {
              print("tapped on flat button");
              setState(() {
                selectedTag = [];
                listOperator1 = [];
                listOperator2 = [];
                listOperator3 = [];
              });
            },
          ),
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
              if (listOperator1.length > 0)
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
                        recruitCalculate.convertTagName(selectedTag[0]),
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
                          for (final name in listOperator1)
                            CharButton(
                              characterName: name,
                            ),
                        ],
                      ),
                    ),
                  ),
                ]),
              if (listOperator2.length > 0)
                TableRow(children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '2',
                        style: kRecruitTitle,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        recruitCalculate.convertTagName(selectedTag[1]),
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
                          for (final name in listOperator2)
                            CharButton(
                              characterName: name,
                            ),
                        ],
                      ),
                    ),
                  ),
                ]),
              if (listOperator3.length > 0)
                TableRow(children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        '3',
                        style: kRecruitTitle,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        recruitCalculate.convertTagName(selectedTag[2]),
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
                          for (final name in listOperator3)
                            CharButton(
                              characterName: name,
                            ),
                        ],
                      ),
                    ),
                  ),
                ]),
//              for (final list in totalList)
//                TableRow(children: [
//                  TableCell(
//                    verticalAlignment: TableCellVerticalAlignment.middle,
//                    child: Center(
//                      child: Text(
//                        '1',
//                        style: kRecruitTitle,
//                      ),
//                    ),
//                  ),
//                  TableCell(
//                    verticalAlignment: TableCellVerticalAlignment.middle,
//                    child: Center(
//                      child: Text(
//                        'Top Operator',
//                        style: kRecruitTitle,
//                      ),
//                    ),
//                  ),
//                  TableCell(
//                    child: Padding(
//                      padding: const EdgeInsets.only(left: 5.0),
//                      child: Wrap(
//                        spacing: 1.0,
//                        children: <Widget>[
//                          for (final name in list)
//                            CharButton(
//                              characterName: name,
//                            ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ]),
            ],
          ),
        ],
      ),
    );
  }

  addTag(String tagName) {
    print("add tag");
    // Check if tag was selected then remove tag from list
    if (selectedTag.contains(tagName)) {
      print("remove $tagName");
      selectedTag.removeWhere((tag) => tag == tagName);
      print(selectedTag);
    } else {
      if (selectedTag.length < 3) {
        selectedTag.add(tagName);
        print("selected tag: ");
        print(selectedTag);
      } else {
        return;
      }
    }

    resetOPList();

    // reload operator list
    if (selectedTag.length > 0) {
      _searchOperators(selectedTag);
    } else {
      setState(() {
        resetOPList();
      });
    }
  }

  resetOPList() {
    listOperator1 = [];
    listOperator2 = [];
    listOperator3 = [];
  }

  _searchOperators(List<String> tagList) async {
    List<String> result = [];
    print('get OP by tag');
    print(tagList);

    for (var i = 0; i < tagList.length; i++) {
      result = [];
      final operators = await _operatorRepository.getOperatorsByTag(tagList[i]);
      for (final operator in operators) {
        result.add(operator.name);
        print("OP name: " + operator.name + ", ID:" + operator.id.toString());
      }
      if (i == 0) {
        setState(() {
          listOperator1 = result;
        });
      } else if (i == 1) {
        setState(() {
          listOperator2 = result;
        });
      } else {
        setState(() {
          listOperator3 = result;
        });
      }
    }

    print("Review OP list");
    print(listOperator1);
    print(listOperator2);

    // find intersection list
    recruitCalculate.findIntersectionList(
        list1: listOperator1,
        list2: listOperator2,
        list3: listOperator3,
        tagList: selectedTag);
  }
}
