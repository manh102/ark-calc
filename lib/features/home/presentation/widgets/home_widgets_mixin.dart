import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../../../core/resources/button_styles.dart';
import '../../../../core/resources/resources.dart';

mixin HomeWidgetsMixin {
  Widget buildTagTable(List<String> selectedTag,
      {required void Function(String tagName) onPressed}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    style: PSStyle.kRecruitTitle,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Wrap(
                    spacing: 1.0,
                    children: <Widget>[
                      ElevatedButton(
                        style: selectedTag.contains("starter")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Starter'),
                        onPressed: () {
                          print('Tapped on Starter Button');
                          onPressed("starter");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("seniorOperator")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Senior Operator'),
                        onPressed: () {
                          print('Tapped on Senior Operator Button');
                          onPressed("seniorOperator");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("topOperator")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Top Operator'),
                        onPressed: () {
                          print('Tapped on Top Operator Button');
                          onPressed("topOperator");
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
                    style: PSStyle.kRecruitTitle,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Wrap(
                    spacing: 1.0,
                    children: <Widget>[
                      ElevatedButton(
                        style: selectedTag.contains("melee")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Melee'),
                        onPressed: () {
                          print('Tapped on Melee Button');
                          onPressed("melee");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("ranged")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Ranged'),
                        onPressed: () {
                          print('Tapped on Ranged Button');
                          onPressed("ranged");
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
                    style: PSStyle.kRecruitTitle,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Wrap(
                    spacing: 1.0,
                    children: <Widget>[
                      ElevatedButton(
                        style: selectedTag.contains("guard")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Guard'),
                        onPressed: () {
                          print('Tapped on Guard Button');
                          onPressed("guard");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("medic")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Medic'),
                        onPressed: () {
                          print('Tapped on Medic Button');
                          onPressed("medic");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("vanguard")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Vanguard'),
                        onPressed: () {
                          print('Tapped on Vanguard Button');
                          onPressed("vanguard");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("caster")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Caster'),
                        onPressed: () {
                          print('Tapped on Caster Button');
                          onPressed("caster");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("sniper")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Sniper'),
                        onPressed: () {
                          print('Tapped on Sniper Button');
                          onPressed("sniper");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("defender")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Defender'),
                        onPressed: () {
                          print('Tapped son Defender Button');
                          onPressed("defender");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("supporter")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Supporter'),
                        onPressed: () {
                          print('Tapped on Supporter Button');
                          onPressed("supporter");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("specialist")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Specialist'),
                        onPressed: () {
                          print('Tapped on Specialist Button');
                          onPressed("specialist");
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
                    style: PSStyle.kRecruitTitle,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Wrap(
                    spacing: 1.0,
                    children: <Widget>[
                      ElevatedButton(
                        style: selectedTag.contains("healing")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Healing'),
                        onPressed: () {
                          print('Tapped on Healing Button');
                          onPressed("healing");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("support")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Support'),
                        onPressed: () {
                          print('Tapped on Support Button');
                          onPressed("support");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("dPS")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('DPS'),
                        onPressed: () {
                          print('Tapped on DPS Button');
                          onPressed("dPS");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("aOE")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('AOE'),
                        onPressed: () {
                          print('Tapped on AOE Button');
                          onPressed("aOE");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("slow")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Slow'),
                        onPressed: () {
                          print('Tapped on Slow Button');
                          onPressed("slow");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("survival")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Survival'),
                        onPressed: () {
                          print('Tapped on Survival Button');
                          onPressed("survival");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("defense")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Defense'),
                        onPressed: () {
                          print('Tapped on Defense Button');
                          onPressed("defense");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("debuff")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Debuff'),
                        onPressed: () {
                          print('Tapped on Debuff Button');
                          onPressed("debuff");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("shift")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Shift'),
                        onPressed: () {
                          print('Tapped on Shift Button');
                          onPressed("shift");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("crowdControl")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Crowd Control'),
                        onPressed: () {
                          print('Tapped on Crowd Control Button');
                          onPressed("crowdControl");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("nuker")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Nuker'),
                        onPressed: () {
                          print('Tapped on Nuker Button');
                          onPressed("nuker");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("summon")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Summon'),
                        onPressed: () {
                          print('Tapped on Summon Button');
                          onPressed("summon");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("fastRedeploy")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Fast-Redeploy'),
                        onPressed: () {
                          print('Tapped on Fast-Redeploy Button');
                          onPressed("fastRedeploy");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("dPRecovery")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('DP-Recovery'),
                        onPressed: () {
                          print('Tapped on DP-Recovery Button');
                          onPressed("dPRecovery");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("robot")
                            ? PSButtonStyle.enableStyle
                            : PSButtonStyle.disableStyle,
                        child: const Text('Robot'),
                        onPressed: () {
                          print('Tapped on Robot Button');
                          onPressed("robot");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Widget buildResultTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                    style: PSStyle.kLabelTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(
                  child: Text(
                    'Tags',
                    style: PSStyle.kLabelTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(
                  child: Text(
                    'Character Possibility',
                    style: PSStyle.kLabelTextStyle,
                  ),
                ),
              ),
            ]),
            // if (listOperator1.length > 0)
            //   TableRow(children: [
            //     RecruitTableCellNumber(text: "1"),
            //     RecruitTableCellTitle(
            //         text: recruitCalculate.convertTagName(selectedTag[0])),
            //     RecruitTableCellContent((characterName) {
            //       print(characterName);
            //       _getOperatorTag(characterName);
            //     }, listOperator: listOperator1),
            //   ]),
            // if (listOperator2.length > 0)
            //   TableRow(children: [
            //     RecruitTableCellNumber(text: "2"),
            //     RecruitTableCellTitle(
            //         text: recruitCalculate.convertTagName(selectedTag[1])),
            //     RecruitTableCellContent((characterName) {
            //       print(characterName);
            //       _getOperatorTag(characterName);
            //     }, listOperator: listOperator2),
            //   ]),
            // if (listOperator3.length > 0)
            //   TableRow(children: [
            //     RecruitTableCellNumber(text: "3"),
            //     RecruitTableCellTitle(
            //         text: recruitCalculate.convertTagName(selectedTag[2])),
            //     RecruitTableCellContent((characterName) {
            //       print(characterName);
            //       _getOperatorTag(characterName);
            //     }, listOperator: listOperator3),
            //   ]),
            // if (combineResult != null &&
            //     combineResult.combineTagList.length ==
            //         combineResult.operatorList.length &&
            //     combineResult.combineTagList != [] &&
            //     combineResult.operatorList != [])
            //   for (var i = 0; i < combineResult.combineTagList.length; i++)
            //     TableRow(children: [
            //       RecruitTableCellNumber(text: (i + 4).toString()),
            //       TableCell(
            //         verticalAlignment: TableCellVerticalAlignment.middle,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             for (final tag in combineResult.combineTagList[i])
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 5.0),
            //                 child: Text(
            //                   recruitCalculate.convertTagName(tag),
            //                   style: kRecruitTitle,
            //                 ),
            //               ),
            //           ],
            //         ),
            //       ),
            //       TableCell(
            //         child: Padding(
            //           padding: const EdgeInsets.only(left: 5.0),
            //           child: Wrap(
            //             spacing: 1.0,
            //             children: <Widget>[
            //               for (final name in combineResult.operatorList[i])
            //                 CharButton(
            //                   (characterName) {
            //                     print(characterName);
            //                     _getOperatorTag(characterName);
            //                   },
            //                   characterName: name,
            //                 ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ]),
            // if (operatorTagDetail.length > 0 && selectedOperator != null)
            //   TableRow(children: [
            //     RecruitTableCellNumber(text: "#"),
            //     RecruitTableCellTitle(text: selectedOperator.name + " Detail"),
            //     RecruitTableCellTagDetail(tagList: operatorTagDetail),
            //   ]),
          ],
        ),
      ],
    );
  }
}
