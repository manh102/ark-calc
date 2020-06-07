import 'package:arklevelcalculator/models/result_model.dart';
import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';
import 'package:arklevelcalculator/components/result_row.dart';


class ResultsPage extends StatelessWidget {
  ResultsPage({
    @required this.result,
  });

  final ResultModel result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARKNIGHTS CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: ListView(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      'Resource',
                      textAlign: TextAlign.right,
                      style: kCategoryTextStyle,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      'Demand',
                      style: kCategoryTextStyle,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: kInactiveCardColour,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ResultRow(
              leftTitle: 'Total Sanity Cost',
              rightTitle: result.totalSanityCost.toString(),
            ),
            ResultRow(
              leftTitle: 'Exp',
              rightTitle: result.exp.toString(),
            ),
            ResultRow(
              leftTitle: 'LS Sanity Cost',
              rightTitle: result.lsSanityCost.toString(),
            ),
            ResultRow(
              leftTitle: 'Coins',
              rightTitle: result.coins.toString(),
            ),
            ResultRow(
              leftTitle: 'CE Sanity Cost',
              rightTitle: result.lsSanityCost.toString(),
            ),
            ResultRow(
              leftTitle: 'Coins for Leveling	',
              rightTitle: result.coinsForLeveling.toString(),
            ),
            ResultRow(
              leftTitle: 'Coins for Elite	',
              rightTitle: result.coinsForElite.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
