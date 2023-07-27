import 'package:hive/hive.dart';

class HiveBoxes {
  static HiveBoxes instance = HiveBoxes._internal();

  factory HiveBoxes() {
    return instance;
  }

  HiveBoxes._internal();

  Future<Box<T>> getBox<T>(String tableName) async {
    if (Hive.isBoxOpen(tableName)) {
      return Hive.box(tableName);
    }
    return Hive.openBox<T>(tableName);
  }
}

class HiveBoxConst {
  static const String BOX_CATEGORY = "ps_categories";
  static const String BOX_BRAND = "ps_brands";
  static const String BOX_OPERATOR = "ps_operators";
}
