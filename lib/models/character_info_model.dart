class CharacterInfoModel {
  int rarity;
  int expCardMap;
  int lungmenCoinMap;
  int currentElite;
  int targetElite;
  int currentLevel;
  int targetLevel;
  int currentExp;

  int lmd;
  int greenCard;
  int blueCard;
  int yellowCard;
  int goldCard;

  CharacterInfoModel(
      {this.rarity = 0,
      this.expCardMap = 0,
      this.lungmenCoinMap = 0,
      this.currentElite = 0,
      this.targetElite = 0,
      this.currentLevel = 1,
      this.targetLevel = 1,
      this.currentExp = 0,
      this.lmd = 0,
      this.greenCard = 0,
      this.blueCard = 0,
      this.yellowCard = 0,
      this.goldCard = 0});
}
