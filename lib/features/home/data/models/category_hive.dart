import 'package:hive/hive.dart';
import 'package:new_ark_calc/features/home/data/models/category_model.dart';

part 'category_hive.g.dart';

@HiveType(typeId: 1)
class CategoryHive {
  @HiveField(0, defaultValue: 0)
  final int id;

  @HiveField(1, defaultValue: "")
  final String name;

  const CategoryHive({
    this.id = 0,
    this.name = "",
  });

  factory CategoryHive.convertFrom(CategoryModel categoryModel) {
    return CategoryHive(id: categoryModel.id, name: categoryModel.name);
  }
}
