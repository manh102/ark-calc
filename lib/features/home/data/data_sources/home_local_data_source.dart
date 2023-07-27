import 'package:new_ark_calc/core/db/hive_boxes.dart';
import 'package:new_ark_calc/core/extensions/iterable_extension.dart';
import 'package:new_ark_calc/features/home/data/models/brand_hive.dart';
import 'package:new_ark_calc/features/home/data/models/category_hive.dart';

import '../models/brand_model.dart';
import '../models/category_model.dart';

abstract class HomeLocalDataSource {
  Future<List<CategoryModel>> getLocalCategories();

  Future<void> saveCategories(List<CategoryHive> categories);
  Future<void> saveOperators(List<CategoryHive> categories);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  Future<void> saveCategories(List<CategoryHive> categories) async {
    final box = await HiveBoxes.instance
        .getBox<CategoryHive>(HiveBoxConst.BOX_CATEGORY);
    await box.putAll(categories.asMap());
  }

  @override
  Future<void> saveOperators(List<CategoryHive> categories) async {
    final box = await HiveBoxes.instance
        .getBox<CategoryHive>(HiveBoxConst.BOX_OPERATOR);
    await box.putAll(categories.asMap());
  }

  @override
  Future<List<CategoryModel>> getLocalCategories() async {
    final box = await HiveBoxes.instance
        .getBox<CategoryHive>(HiveBoxConst.BOX_CATEGORY);
    return box.values.mapList((source) => CategoryModel.fromHive(source));
  }
}
