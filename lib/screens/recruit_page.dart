import 'package:arklevelcalculator/Repositories/operator_repository.dart';
import 'package:arklevelcalculator/components/Cells/recruit_result_table_cell_content.dart';
import 'package:arklevelcalculator/components/Cells/recruit_tag_detail_cell.dart';
import 'package:arklevelcalculator/components/Cells/recruit_result_table_cell_title.dart';
import 'package:arklevelcalculator/components/chart_button.dart';
import 'package:arklevelcalculator/components/Cells/recruit_result_table_cell_number.dart';
import 'package:arklevelcalculator/entities/operator.dart';
import 'package:arklevelcalculator/models/recruit_combine_result.dart';
import 'package:arklevelcalculator/recruit_calculate.dart';
import 'package:flutter/cupertino.dart';
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
  List<Operator> listOperator1 = [];
  List<Operator> listOperator2 = [];
  List<Operator> listOperator3 = [];
  List<String> selectedTag = [];

  List<String> operatorTagDetail = [];
  Operator selectedOperator;

  RecruitCombineModel combineResult = null;
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
                          color: selectedTag.contains("starter")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Starter'),
                          onPressed: () {
                            print('Tapped on Starter Button');
                            addTag("starter");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("seniorOperator")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Senior Operator'),
                          onPressed: () {
                            print('Tapped on Senior Operator Button');
                            addTag("seniorOperator");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("topOperator")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
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
                          color: selectedTag.contains("melee")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Melee'),
                          onPressed: () {
                            print('Tapped on Melee Button');
                            addTag("melee");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("ranged")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Ranged'),
                          onPressed: () {
                            print('Tapped on Ranged Button');
                            addTag("ranged");
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
                          color: selectedTag.contains("guard")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Guard'),
                          onPressed: () {
                            print('Tapped on Guard Button');
                            addTag("guard");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("medic")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Medic'),
                          onPressed: () {
                            print('Tapped on Medic Button');
                            addTag("medic");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("vanguard")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Vanguard'),
                          onPressed: () {
                            print('Tapped on Vanguard Button');
                            addTag("vanguard");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("caster")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Caster'),
                          onPressed: () {
                            print('Tapped on Caster Button');
                            addTag("caster");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("sniper")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Sniper'),
                          onPressed: () {
                            print('Tapped on Sniper Button');
                            addTag("sniper");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("defender")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Defender'),
                          onPressed: () {
                            print('Tapped son Defender Button');
                            addTag("defender");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("supporter")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Supporter'),
                          onPressed: () {
                            print('Tapped on Supporter Button');
                            addTag("supporter");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("specialist")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
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
                          color: selectedTag.contains("healing")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Healing'),
                          onPressed: () {
                            print('Tapped on Healing Button');
                            addTag("healing");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("support")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Support'),
                          onPressed: () {
                            print('Tapped on Support Button');
                            addTag("support");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("dPS")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('DPS'),
                          onPressed: () {
                            print('Tapped on DPS Button');
                            addTag("dPS");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("aOE")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('AOE'),
                          onPressed: () {
                            print('Tapped on AOE Button');
                            addTag("aOE");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("slow")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Slow'),
                          onPressed: () {
                            print('Tapped on Slow Button');
                            addTag("slow");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("survival")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Survival'),
                          onPressed: () {
                            print('Tapped on Survival Button');
                            addTag("survival");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("defense")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Defense'),
                          onPressed: () {
                            print('Tapped on Defense Button');
                            addTag("defense");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("debuff")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Debuff'),
                          onPressed: () {
                            print('Tapped on Debuff Button');
                            addTag("debuff");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("shift")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Shift'),
                          onPressed: () {
                            print('Tapped on Shift Button');
                            addTag("shift");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("crowdControl")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Crowd Control'),
                          onPressed: () {
                            print('Tapped on Crowd Control Button');
                            addTag("crowdControl");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("nuker")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Nuker'),
                          onPressed: () {
                            print('Tapped on Nuker Button');
                            addTag("nuker");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("summon")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Summon'),
                          onPressed: () {
                            print('Tapped on Summon Button');
                            addTag("summon");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("fastRedeploy")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('Fast-Redeploy'),
                          onPressed: () {
                            print('Tapped on Fast-Redeploy Button');
                            addTag("fastRedeploy");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("dPRecovery")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
                          child: const Text('DP-Recovery'),
                          onPressed: () {
                            print('Tapped on DP-Recovery Button');
                            addTag("dPRecovery");
                          },
                        ),
                        RaisedButton(
                          color: selectedTag.contains("robot")
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.inactiveGray,
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
                selectedOperator = null;
                operatorTagDetail = [];
                if (combineResult != null) {
                  combineResult.combineTagList = [];
                  combineResult.operatorList = [];
                }
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
                  RecruitTableCellNumber(text: "1"),
                  RecruitTableCellTitle(
                      text: recruitCalculate.convertTagName(selectedTag[0])),
                  RecruitTableCellContent((characterName) {
                    print(characterName);
                    _getOperatorTag(characterName);
                  }, listOperator: listOperator1),
                ]),
              if (listOperator2.length > 0)
                TableRow(children: [
                  RecruitTableCellNumber(text: "2"),
                  RecruitTableCellTitle(
                      text: recruitCalculate.convertTagName(selectedTag[1])),
                  RecruitTableCellContent((characterName) {
                    print(characterName);
                    _getOperatorTag(characterName);
                  }, listOperator: listOperator2),
                ]),
              if (listOperator3.length > 0)
                TableRow(children: [
                  RecruitTableCellNumber(text: "3"),
                  RecruitTableCellTitle(
                      text: recruitCalculate.convertTagName(selectedTag[2])),
                  RecruitTableCellContent((characterName) {
                    print(characterName);
                    _getOperatorTag(characterName);
                  }, listOperator: listOperator3),
                ]),
              if (combineResult != null &&
                  combineResult.combineTagList.length ==
                      combineResult.operatorList.length &&
                  combineResult.combineTagList != [] &&
                  combineResult.operatorList != [])
                for (var i = 0; i < combineResult.combineTagList.length; i++)
                  TableRow(children: [
                    RecruitTableCellNumber(text: (i + 4).toString()),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          for (final tag in combineResult.combineTagList[i])
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                recruitCalculate.convertTagName(tag),
                                style: kRecruitTitle,
                              ),
                            ),
                        ],
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Wrap(
                          spacing: 1.0,
                          children: <Widget>[
                            for (final name in combineResult.operatorList[i])
                              CharButton(
                                (characterName) {
                                  print(characterName);
                                  _getOperatorTag(characterName);
                                },
                                characterName: name,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ]),
              if (operatorTagDetail.length > 0 && selectedOperator != null)
                TableRow(children: [
                  RecruitTableCellNumber(text: "#"),
                  RecruitTableCellTitle(
                      text: selectedOperator.name + " Detail"),
                  RecruitTableCellTagDetail(tagList: operatorTagDetail),
                ]),
            ],
          ),
          SizedBox(
            height: 60.0,
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
    if (combineResult != null) {
      combineResult.combineTagList = [];
      combineResult.operatorList = [];
    }
  }

  _searchOperators(List<String> tagList) async {
    print('get OP by tag');
    print(tagList);

    for (var i = 0; i < tagList.length; i++) {
      List<Operator> result = [];
      final operators = await _operatorRepository.getOperatorsByTag(tagList[i]);
      for (final operator in operators) {
        result.add(operator);
        //print("OP name: " + operator.name + ", ID:" + operator.id.toString());
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

    // find intersection list
    combineResult = recruitCalculate.findIntersectionList(
        list1: listOperator1,
        list2: listOperator2,
        list3: listOperator3,
        tagList: selectedTag);

    if (combineResult != null) {
      print(combineResult.combineTagList);
      print(combineResult.operatorList);
    }
  }

  _getOperatorTag(String name) async {
    print('Get operator by name');
    selectedOperator = null;
    operatorTagDetail = [];
    List<String> tagList = [];
    final operator = await _operatorRepository.getOperator(name);
    setState(() {
      selectedOperator = operator;
      operatorTagDetail = selectedOperator.getTag();
    });
  }
}
