import 'package:arklevelcalculator/constants.dart';
import 'package:flutter/cupertino.dart';

class RecruitCalculate {
  List<RecruitTag> tags = [];

  RecruitCalculate({@required this.tags});

  List getPossibleNames() {
    return ['Texas', 'Shining'];
  }
}
