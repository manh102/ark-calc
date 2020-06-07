class LevelMaxList {
  List<num> levelMax = [];
}

class MaxLevelModel {
  List<LevelMaxList> maxLevel = [];

  MaxLevelModel(this.maxLevel);

  MaxLevelModel.fromJson(Map<String, dynamic> json) {
    List maxLevelListJson = json['maxLevel'];
    for (var rarity in maxLevelListJson) {
      LevelMaxList levelMaxList = LevelMaxList();
      for (var levelMax in rarity) {
        levelMaxList.levelMax.add(levelMax);
      }
      maxLevel.add(levelMaxList);
    }
  }
}
