import '../../features/home/data/models/combine_result_model.dart';
import '../../features/home/data/models/operator.dart';

class RecruitUtils {
  List<List<String>> intersectionList = [];
  List<int> combineTagList = [];

  RecruitCombineModel findIntersectionList(
      {required List<Operator> list1,
      required List<Operator> list2,
      required List<Operator> list3,
      required List<String> tagList}) {
    print("Find intersection list");
    combineTagList = [];
    intersectionList = [];

    if (tagList.length < 2) {
      return RecruitCombineModel();
    }

    // create total list
    List<String> totalName = [];
    List<Operator> totalOperator = [];
    for (final operator in list1) {
      if (!totalName.contains(operator.name)) {
        totalName.add(operator.name ?? '');
        totalOperator.add(operator);
      }
    }
    for (final operator in list2) {
      if (!totalName.contains(operator.name)) {
        totalName.add(operator.name ?? '');
        totalOperator.add(operator);
      }
    }
    for (final operator in list3) {
      if (!totalName.contains(operator.name)) {
        totalName.add(operator.name ?? '');
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
        List<String> combineOPList = [operator.name ?? ''];
        intersectionList.add(combineOPList);
      } else {
        // exTag already exist in combineTagList
        // add name of OP to that list in combineOPList
        int index = combineTagList.indexOf(encodedTag);
        if (!intersectionList[index].contains(operator.name)) {
          intersectionList[index].add(operator.name ?? '');
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

      case "seniorOperator":
        {
          return "Senior Operator";
        }

      case "topOperator":
        {
          return "Top Operator";
        }

      case "melee":
        {
          return "Melee";
        }

      case "ranged":
        {
          return "Ranged";
        }

      case "guard":
        {
          return "Guard";
        }

      case "medic":
        {
          return "Medic";
        }

      case "vanguard":
        {
          return "Vanguard";
        }

      case "caster":
        {
          return "Caster";
        }

      case "sniper":
        {
          return "Sniper";
        }

      case "defender":
        {
          return "Defender";
        }

      case "supporter":
        {
          return "Supporter";
        }

      case "specialist":
        {
          return "Specialist";
        }

      case "healing":
        {
          return "Healing";
        }

      case "support":
        {
          return "Support";
        }

      case "dPS":
        {
          return "DPS";
        }

      case "aOE":
        {
          return "AOE";
        }

      case "slow":
        {
          return "Slow";
        }

      case "survival":
        {
          return "Survival";
        }

      case "defense":
        {
          return "Defense";
        }

      case "debuff":
        {
          return "Debuff";
        }

      case "shift":
        {
          return "Shift";
        }

      case "crowdControl":
        {
          return "CrowdControl";
        }

      case "nuker":
        {
          return "Nuker";
        }

      case "summon":
        {
          return "Summon";
        }

      case "fastRedeploy":
        {
          return "Fast-Redeploy";
        }

      case "dPRecovery":
        {
          return "DP-Recovery";
        }

      case "robot":
        {
          return "Robot";
        }

      default:
        return "";
    }
  }
}
