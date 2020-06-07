class ExpList {
  List<num> exp = [];
}

class UpgradeCostMapModel {
  List<ExpList> mapList = [];

  UpgradeCostMapModel(this.mapList);

  UpgradeCostMapModel.fromJson(Map<String, dynamic> json) {
    List mapListJson = json['characterUpgradeCostMap'];
    for (var tire in mapListJson) {
      ExpList expList = ExpList();
      for (var exp in tire) {
        expList.exp.add(exp);
      }
      mapList.add(expList);
    }
  }
}
