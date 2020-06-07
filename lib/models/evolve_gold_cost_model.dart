class GoldList {
  List<num> gold = [];
}

class EvolveGoldCostModel {
  List<GoldList> goldCost = [];

  EvolveGoldCostModel(this.goldCost);

  EvolveGoldCostModel.fromJson(Map<String, dynamic> json) {
    List evolveGoldCostJson = json['evolveGoldCost'];
    for (var tire in evolveGoldCostJson) {
      GoldList goldList = GoldList();
      for (var gold in tire) {
        goldList.gold.add(gold);
      }
      goldCost.add(goldList);
    }
  }
}
