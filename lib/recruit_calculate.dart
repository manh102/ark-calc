import 'package:arklevelcalculator/constants.dart';
import 'package:get_it/get_it.dart';

import 'Repositories/operator_repository.dart';
import 'models/recruit_combine_result.dart';

class RecruitCalculate {
  List<List<String>> intersectionList = [];
  List<int> combineTagList = [];

  RecruitCombineModel findIntersectionList(
      {List<String> list1,
      List<String> list2,
      List<String> list3,
      List<String> tagList}) {
    print("Find intersection list");
    combineTagList = [];
    intersectionList = [];

    if (tagList.length < 2) {
      return null;
    }

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
      var encodedTag = 0;
      if (list1.contains(name)) {
        encodedTag += 2;
      }
      if (list2.contains(name)) {
        encodedTag += 3;
      }
      if (list3.contains(name)) {
        encodedTag += 4;
      }
      // Check if there is a combination of three tags, then split to its child tag
      // ex: 9 (included three tags) -> slit to (5, 6, 7)
      if (encodedTag == 9) {
        extractCombineList(5, name);
        extractCombineList(6, name);
        extractCombineList(7, name);
      } else {
        extractCombineList(encodedTag, name);
      }
    }

    print("////Show intersection list: ");
    print(combineTagList);
    print(intersectionList);
    print("////////////////////////////");
    RecruitCombineModel recruitCombineResult = RecruitCombineModel(
        operatorList: intersectionList,
        combineTagList: decodeTagList(combineTagList, tagList));
    return recruitCombineResult;
  }

  extractCombineList(int encodedTag, String name) {
    if (encodedTag > 4) {
      if (!combineTagList.contains(encodedTag)) {
        combineTagList.add(encodedTag);
        List<String> combineOPList = [name];
        intersectionList.add(combineOPList);
      } else {
        // exTag already exist in combineTagList
        // add name of OP to that list in combineOPList
        int index = combineTagList.indexOf(encodedTag);
        if (!intersectionList[index].contains(name)) {
          intersectionList[index].add(name);
        }
      }
    }
  }

  List<List<String>> decodeTagList(List<int> encodedTag, List<String> tagList) {
    List<List<String>> decodedTagList = [];
    for (final value in encodedTag) {
      if (value == 5) {
        decodedTagList.add([tagList[0], tagList[1]]);
      }
      if (value == 6) {
        decodedTagList.add([tagList[0], tagList[2]]);
      }
      if (value == 7) {
        decodedTagList.add([tagList[1], tagList[2]]);
      }
      if (value == 9) {
        decodedTagList.add([tagList[0], tagList[1], tagList[2]]);
      }
    }
    return decodedTagList;
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
