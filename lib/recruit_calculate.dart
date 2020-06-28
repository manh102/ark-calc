import 'package:arklevelcalculator/constants.dart';
import 'package:get_it/get_it.dart';

import 'Repositories/operator_repository.dart';

class RecruitCalculate {
  List<List<String>> intersectionList = [];
  List<List<String>> combineTagList = [];

  findIntersectionList(
      {List<String> list1,
      List<String> list2,
      List<String> list3,
      List<String> tagList}) {
    print("Find intersection list");

    // create total list
    List<String> totalList = [];
    for (final name in list1) {
      totalList.add(name);
    }
    for (final name in list2) {
      totalList.add(name);
    }
    for (final name in list3) {
      totalList.add(name);
    }

    // dedublicate list
    totalList = totalList.toSet().toList();

    for (final name in totalList) {
      List<String> exTag = [];
      if (list1.contains(name)) {
        exTag.add(tagList[0]);
      }
      if (list2.contains(name)) {
        exTag.add(tagList[1]);
      }
      if (list3.contains(name)) {
        exTag.add(tagList[2]);
      }

      // Check if there is a combine tag
      if (exTag.length > 1) {
        if (!combineTagList.contains(exTag)) {
          print("ahihi");
          print(exTag);
          print(combineTagList.contains(exTag));
          print(combineTagList);
          combineTagList.add(exTag);
          List<String> combineOPList = [name];
          // TODO: test
          if (!intersectionList.contains([name])) {
            intersectionList.add(combineOPList);
          }
        } else {
          // exTag already exist in combineTagList
          // add name of OP to that list in combineOPList
          int index = combineTagList.indexOf(exTag);
          intersectionList[index].add(name);
        }
      }
    }

    print("////Show intersection list: ");
    print(combineTagList);
    print(intersectionList);
    print("////////////////////////////");
  }

  String convertTagName(String tag) {
    switch (tag) {
      case "starter":
        {
          return "Starter";
        }
        break;
      case "seniorOperator":
        {
          return "Senior Operator";
        }
        break;
      case "topOperator":
        {
          return "Top Operator";
        }
        break;
      case "melee":
        {
          return "Melee";
        }
        break;
      case "ranged":
        {
          return "Ranged";
        }
        break;
      case "guard":
        {
          return "Guard";
        }
        break;
      case "medic":
        {
          return "Medic";
        }
        break;
      case "vanguard":
        {
          return "Vanguard";
        }
        break;
      case "caster":
        {
          return "Caster";
        }
        break;
      case "sniper":
        {
          return "Sniper";
        }
        break;
      case "supporter":
        {
          return "Supporter";
        }
        break;
      case "specialist":
        {
          return "Specialist";
        }
        break;
      case "healing":
        {
          return "Healing";
        }
        break;
      case "support":
        {
          return "Support";
        }
        break;
      case "dPS":
        {
          return "DPS";
        }
        break;
      case "aOE":
        {
          return "AOE";
        }
        break;
      case "slow":
        {
          return "Slow";
        }
        break;
      case "survival":
        {
          return "Survival";
        }
        break;
      case "defense":
        {
          return "Defense";
        }
        break;
      case "debuff":
        {
          return "Debuff";
        }
        break;
      case "shift":
        {
          return "Shift";
        }
        break;
      case "crowdControl":
        {
          return "CrowdControl";
        }
        break;
      case "nuker":
        {
          return "Nuker";
        }
        break;
      case "summon":
        {
          return "Summon";
        }
        break;
      case "fastRedeploy":
        {
          return "Fast-Redeploy";
        }
        break;
      case "dPRecovery":
        {
          return "DP-Recovery";
        }
        break;
      case "robot":
        {
          return "Robot";
        }
        break;
    }
  }
}
