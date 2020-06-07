class ExpList {
  List<num> exp = [];
}

class CharacterExpModel {
  List<ExpList> tierlist = [];

  CharacterExpModel(this.tierlist);

  CharacterExpModel.fromJson(Map<String, dynamic> json) {
    List levelList = json['characterExpMap'];
    for (var tire in levelList) {
      ExpList expList = ExpList();
      for (var exp in tire) {
        expList.exp.add(exp);
      }
      tierlist.add(expList);
    }
  }
}
