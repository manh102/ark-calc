import 'dart:convert';
import 'dart:ffi';
import 'package:arklevelcalculator/components/dialog.dart';
import 'package:arklevelcalculator/components/reusable_drop_down_button.dart';
import 'package:arklevelcalculator/models/character_exp_model.dart';
import 'package:arklevelcalculator/models/character_info_model.dart';
import 'package:arklevelcalculator/models/evolve_gold_cost_model.dart';
import 'package:arklevelcalculator/models/max_level_model.dart';
import 'package:arklevelcalculator/models/result_model.dart';
import 'package:arklevelcalculator/models/upgrade_cost_map_model.dart';
import 'package:arklevelcalculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arklevelcalculator/components/reusable_card.dart';
import 'package:arklevelcalculator/constants.dart';
import 'package:flutter/services.dart';
import 'package:arklevelcalculator/components/bottom_button.dart';
import 'package:arklevelcalculator/components/enhanced_textfield.dart';
import 'package:arklevelcalculator/level_calculate.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String rarity = 'Rarity★';
  String expCardMap = 'EXP Card Map';
  String lungmenCoinMap = 'Lungmen Coin Map';
  String currentElt = 'Current Elite';
  String targetElt = 'Target Elite';
  String targetLvl = 'Target Level';
  String currentLvl = 'Current Level';
  String currentExp = 'Current Exp';
  String lmd = 'LMD';
  String greenExpCard = 'Green Card';
  String blueExpCard = 'Blue Card';
  String yellowExpCard = 'Yellow Card';
  String goldExpCard = 'Gold Card';

  CharacterInfoModel charInfo = CharacterInfoModel();

  // Exp each level of each tier
  CharacterExpModel characterExpModel;
  // Max level of each tier
  MaxLevelModel maxLevelModel;
  // Exp from map
  UpgradeCostMapModel upgradeCostMapModel;
  // Gold from map
  EvolveGoldCostModel evolveGoldCostModel;

  Future<String> loadJson() async =>
      await rootBundle.loadString('assets/aklevel.json');

  Future getResult() async {
    String jsonString = await loadJson();
    final jsonResponse = json.decode(jsonString);
    characterExpModel = new CharacterExpModel.fromJson(jsonResponse);
    maxLevelModel = new MaxLevelModel.fromJson(jsonResponse);
    upgradeCostMapModel = new UpgradeCostMapModel.fromJson(jsonResponse);
    evolveGoldCostModel = new EvolveGoldCostModel.fromJson(jsonResponse);
  }

  Void unFocusTextfield(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild.unfocus();
    }
  }

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    getResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ARKNIGHTS CALCULATOR',
        ),
      ),
      body: GestureDetector(
        onTap: () {
          unFocusTextfield(context);
        },
        child: ListView(
          children: <Widget>[
            // RARITY
            ReusableCard(
              title: rarity,
              colour: kActiveCardColour,
              cardChild: ReusableDropdownButton(
                (rarityValue) {
                  charInfo.rarity = rarityValue;
                  print(rarityValue);
                },
                dropdownValues: [
                  '6',
                  '5',
                  '4',
                  '3',
                  '2',
                  '1',
                ],
              ),
            ),
            // EXP CARD MAP
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    title: expCardMap,
                    colour: kActiveCardColour,
                    cardChild: ReusableDropdownButton(
                      (expCardMapVal) {
                        charInfo.expCardMap = expCardMapVal;
                        print(expCardMapVal);
                      },
                      dropdownValues: [
                        'LS-5',
                      ],
                      onPress: () {
                        unFocusTextfield(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    title: lungmenCoinMap,
                    colour: kActiveCardColour,
                    cardChild: ReusableDropdownButton(
                      (lungmenCoinMapVal) {
                        charInfo.lungmenCoinMap = lungmenCoinMapVal;
                        print(lungmenCoinMapVal);
                      },
                      dropdownValues: [
                        'CE-5',
                      ],
                      onPress: () {
                        unFocusTextfield(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            // CURRRENT ELITE
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    title: currentElt,
                    colour: kActiveCardColour,
                    cardChild: ReusableDropdownButton(
                      (currentEltVal) {
                        charInfo.currentElite = currentEltVal;
                        print(currentEltVal);
                      },
                      dropdownValues: [
                        '0',
                        '1',
                        '2',
                      ],
                      onPress: () {
                        unFocusTextfield(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    title: targetElt,
                    colour: kActiveCardColour,
                    cardChild: ReusableDropdownButton(
                      (targetEltVal) {
                        charInfo.targetElite = targetEltVal;
                        print(targetEltVal);
                      },
                      dropdownValues: [
                        '0',
                        '1',
                        '2',
                      ],
                      onPress: () {
                        unFocusTextfield(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            // CURRENT LEVEL
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    title: currentLvl,
                    colour: kActiveCardColour,
                    cardChild: EnhancedTextfield(
                      (text) {
                        charInfo.currentLevel = int.parse(text);
                      },
                      hintText: '1',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    title: targetLvl,
                    colour: kActiveCardColour,
                    cardChild: EnhancedTextfield(
                      (text) {
                        charInfo.targetLevel = int.parse(text);
                      },
                      hintText: '1',
                    ),
                  ),
                ),
              ],
            ),
            ReusableCard(
              title: currentExp,
              colour: kActiveCardColour,
              cardChild: EnhancedTextfield(
                (text) {
                  charInfo.currentExp = int.parse(text);
                },
                hintText: 'Enter your current exp',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Resources currently have:',
                style: kCategoryTextStyle,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    title: lmd,
                    colour: kActiveCardColour,
                    cardChild: EnhancedTextfield(
                      (text) {
                        charInfo.lmd = int.parse(text);
                      },
                      hintText: '0',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    title: greenExpCard,
                    colour: kActiveCardColour,
                    cardChild: EnhancedTextfield(
                      (text) {
                        charInfo.greenCard = int.parse(text);
                      },
                      hintText: '0',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    title: blueExpCard,
                    colour: kActiveCardColour,
                    cardChild: EnhancedTextfield(
                      (text) {
                        charInfo.blueCard = int.parse(text);
                      },
                      hintText: '0',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    title: yellowExpCard,
                    colour: kActiveCardColour,
                    cardChild: EnhancedTextfield(
                      (text) {
                        charInfo.yellowCard = int.parse(text);
                      },
                      hintText: '0',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    title: goldExpCard,
                    colour: kActiveCardColour,
                    cardChild: EnhancedTextfield(
                      (text) {
                        charInfo.goldCard = int.parse(text);
                      },
                      hintText: '0',
                    ),
                  ),
                ),
              ],
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                // Calculate
                LevelCalculate calc = LevelCalculate(
                  charInfo: charInfo,
                  characterExpModel: characterExpModel,
                  maxLevelModel: maxLevelModel,
                  upgradeCostMapModel: upgradeCostMapModel,
                  evolveGoldCostModel: evolveGoldCostModel,
                );

                switch (calc.inputValidate()) {
                  case ARKError.None:
                    {
                      ResultModel result = calc.calculateExp();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsPage(
                            result: result,
                          ),
                        ),
                      );
                    }
                    break;

                  case ARKError.LevelMustBeANumber:
                    {
                      MyDialog().showMyDialog(context, kLevelMustBeANumber);
                    }
                    break;

                  case ARKError.TextfieldInputMustBeANumber:
                    {
                      MyDialog().showMyDialog(
                          context, kInputFromTextfieldIsNotNumber);
                    }
                    break;

                  case ARKError.TargetLevelError:
                    {
                      MyDialog()
                          .showMyDialog(context, kTargetLevelCannotBeLower);
                    }
                    break;

                  case ARKError.LevelOutOfRange:
                    {
                      MyDialog().showMyDialog(context, kLevelOutOfRange);
                    }
                    break;

                  case ARKError.ExpMustBeANumber:
                    {
                      MyDialog().showMyDialog(context, kExpMustBeANumber);
                    }
                    break;

                  case ARKError.ExpOutOfRange:
                    {
                      MyDialog().showMyDialog(context, kExpOutOfRange);
                    }
                    break;

                  default:
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
