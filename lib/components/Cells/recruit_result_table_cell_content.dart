import 'package:arklevelcalculator/entities/operator.dart';
import 'package:flutter/material.dart';
import 'package:arklevelcalculator/components/chart_button.dart';

typedef StringValue = void Function(String);

class RecruitTableCellContent extends StatelessWidget {
  final List<Operator> listOperator;
  StringValue callback;
  RecruitTableCellContent(this.callback, {this.listOperator});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Wrap(
          spacing: 1.0,
          children: <Widget>[
            for (final operator in listOperator)
              CharButton(
                (value) {
                  callback(value);
                },
                characterName: operator.name,
              ),
          ],
        ),
      ),
    );
  }
}
