import 'dart:math';
import 'package:arklevelcalculator/constants.dart';
import 'package:arklevelcalculator/models/character_exp_model.dart';
import 'package:arklevelcalculator/models/max_level_model.dart';
import 'package:arklevelcalculator/models/result_model.dart';
import 'package:arklevelcalculator/models/upgrade_cost_map_model.dart';
import 'package:arklevelcalculator/models/evolve_gold_cost_model.dart';
import 'package:flutter/cupertino.dart';
import 'models/character_info_model.dart';

class LevelCalculate {
  final CharacterInfoModel charInfo;
  final CharacterExpModel characterExpModel;
  final MaxLevelModel maxLevelModel;
  final UpgradeCostMapModel upgradeCostMapModel; // LMD cost for each level
  final EvolveGoldCostModel evolveGoldCostModel;

  int star = 0;
  int cev = 0;
  int cl = 0;
  int ce = 0;
  int te = 0;
  int tl = 0;
  int ga = 0;
  int bb = 0;
  int bp = 0;
  int bm = 0;
  int ba = 0;

  int es = 0;
  num cs = 0;
  num ea = 0;

  LevelCalculate(
      {@required this.charInfo,
      @required this.characterExpModel,
      @required this.maxLevelModel,
      @required this.upgradeCostMapModel,
      @required this.evolveGoldCostModel}) {
    star = 5 - charInfo.rarity;
    cev = charInfo.currentElite;
    cl = charInfo.currentLevel;
    ce = charInfo.currentExp;
    te = charInfo.targetElite;
    tl = charInfo.targetLevel;
    ga = charInfo.lmd;
    bb = charInfo.greenCard;
    bp = charInfo.blueCard;
    bm = charInfo.yellowCard;
    ba = charInfo.goldCard;
  }

  ARKError inputValidate() {
    ARKError result = ARKError.None;

    // 1.レベル確認
    if (!(cl is int) || !(tl is int)) {
      result = ARKError.LevelMustBeANumber;
    }
    // 2.テキストフィールドの入力を確認
    if (!(ga is int) ||
        !(bb is int) ||
        !(bp is int) ||
        !(bm is int) ||
        !(ba is int)) {
      result = ARKError.TextfieldInputMustBeANumber;
    }
    // 3.現在レベル目指すレベルを確認
    if ((te < cev) || (te == cev && tl < cl)) {
      result = ARKError.TargetLevelError;
    }
    // 4.レベル範囲の確認  cl > maxLevel[star - 1][cev] || tl > maxLevel[star - 1][te]
    if ((cl > maxLevelModel.maxLevel[star].levelMax[cev]) ||
        (tl > maxLevelModel.maxLevel[star].levelMax[te])) {
      result = ARKError.LevelOutOfRange;
    }
    // 5.入力したExpを確認
    if (!(ce is int) || (ce < 0)) {
      result = ARKError.ExpMustBeANumber;
    }
    // 6.Exp範囲を確認
    if ((cl == maxLevelModel.maxLevel[star].levelMax[cev] && ce != 0) ||
        (cl != maxLevelModel.maxLevel[star].levelMax[cev] &&
            ce >= characterExpModel.tierlist[cev].exp[cl - 1])) {
      result = ARKError.ExpOutOfRange;
    }

    print('Validate result: $result');
    return result;
  }

  ResultModel calculateExp() {
    // check if current level is max level
    if (charInfo.currentLevel ==
        maxLevelModel
            .maxLevel[5 - charInfo.rarity].levelMax[charInfo.currentElite]) {
    } else {
      es = cl == maxLevelModel.maxLevel[star]
          ? 0
          : characterExpModel.tierlist[cev].exp[cl - 1] - ce;
      cs = cl == maxLevelModel.maxLevel[star]
          ? 0
          : upgradeCostMapModel.mapList[cev].exp[cl - 1] *
              es /
              (characterExpModel.tierlist[cev].exp[cl - 1]);
      cl++;
      for (var i = cev, j = cl; i <= te; i++) {
        while (i < te && j < maxLevelModel.maxLevel[star].levelMax[i]) {
          es += characterExpModel.tierlist[i].exp[j - 1];
          cs += upgradeCostMapModel.mapList[i].exp[j - 1];
          j++;
        }
        while (i == te && j < tl) {
          es += characterExpModel.tierlist[i].exp[j - 1];
          cs += upgradeCostMapModel.mapList[i].exp[j - 1];
          j++;
        }
        j = 1;
      }
      for (var i = cev; i < te; i++) {
        ea += evolveGoldCostModel.goldCost[star].gold[i];
      }

      num bs = bb * 200 + bp * 400 + bm * 1000 + ba * 2000;
      num eb = es - bs;
      if (eb < 0) {
        eb = 0;
      }
      num gs = pow((cs + ea), 1);
      num gn = gs - ga;
      if (gn < 0) {
        gn = 0;
      }
      num lsn = pow((eb / 7500), 1).ceil();
      num cen = pow((gn / 7500), 1).ceil();

      print((lsn + cen) * 30);
      print(eb);
      print(lsn * 30);
      print(gn);
      print(cen * 30);
      print(pow(cs, 1));
      print(ea);

      return ResultModel(
          totalSanityCost: (lsn + cen) * 30,
          exp: eb,
          lsSanityCost: lsn * 30,
          coins: gn,
          ceSanityCost: cen * 30,
          coinsForLeveling: pow(cs, 1),
          coinsForElite: ea);
    }
    return ResultModel();
  }
}
