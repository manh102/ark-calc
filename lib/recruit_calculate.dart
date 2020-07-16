import 'package:arklevelcalculator/entities/operator.dart';
import 'models/recruit_combine_result.dart';

class RecruitCalculate {
  List<List<String>> intersectionList = [];
  List<int> combineTagList = [];

  RecruitCombineModel findIntersectionList(
      {List<Operator> list1,
      List<Operator> list2,
      List<Operator> list3,
      List<String> tagList}) {
    print("Find intersection list");
    combineTagList = [];
    intersectionList = [];

    if (tagList.length < 2) {
      return null;
    }

    // create total list
    List<String> totalName = [];
    List<Operator> totalOperator = [];
    for (final operator in list1) {
      if (!totalName.contains(operator.name)) {
        totalName.add(operator.name);
        totalOperator.add(operator);
      }
    }
    for (final operator in list2) {
      if (!totalName.contains(operator.name)) {
        totalName.add(operator.name);
        totalOperator.add(operator);
      }
    }
    for (final operator in list3) {
      if (!totalName.contains(operator.name)) {
        totalName.add(operator.name);
        totalOperator.add(operator);
      }
    }

    for (final operator in totalOperator) {
      var encodedTag = 0;
      if (operator.get(tagList[0]) == true) {
        encodedTag += 2;
      }
      if (operator.get(tagList[1]) == true) {
        encodedTag += 3;
      }
      if (tagList.length >= 3 && operator.get(tagList[2]) == true) {
        encodedTag += 4;
      }
      // Check if there is a combination of three tags, then split to its child tag
      // ex: 9 (included three tags) -> slit to (5, 6, 7)
      if (encodedTag == 9) {
        extractCombineList(5, operator, tagList);
        extractCombineList(6, operator, tagList);
        extractCombineList(7, operator, tagList);
        extractCombineList(9, operator, tagList);
      } else {
        extractCombineList(encodedTag, operator, tagList);
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

  extractCombineList(int encodedTag, Operator operator, List<String> tagList) {
    if (encodedTag > 4) {
      List<String> decodedTag = decodeTag(encodedTag, tagList);
      if (operator.get("topOperator") == true &&
          !decodedTag.contains("topOperator")) {
        return;
      }
      if (!combineTagList.contains(encodedTag)) {
        combineTagList.add(encodedTag);
        List<String> combineOPList = [operator.name];
        intersectionList.add(combineOPList);
      } else {
        // exTag already exist in combineTagList
        // add name of OP to that list in combineOPList
        int index = combineTagList.indexOf(encodedTag);
        if (!intersectionList[index].contains(operator.name)) {
          intersectionList[index].add(operator.name);
        }
      }
    }
  }

  List<String> decodeTag(int encodedTag, List<String> tagList) {
    List<String> decodedTag = [];
    if (encodedTag == 5) {
      decodedTag = [tagList[0], tagList[1]];
    }
    if (encodedTag == 6) {
      decodedTag = [tagList[0], tagList[2]];
    }
    if (encodedTag == 7) {
      decodedTag = [tagList[1], tagList[2]];
    }
    if (encodedTag == 9) {
      decodedTag = [tagList[0], tagList[1], tagList[2]];
    }
    return decodedTag;
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
      case "defender":
        {
          return "Defender";
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
