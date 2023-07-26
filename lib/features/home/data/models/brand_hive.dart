import 'package:hive/hive.dart';
import 'package:new_ark_calc/features/home/data/models/brand_model.dart';

part 'brand_hive.g.dart';

@HiveType(typeId: 0)
class BrandHive {
  @HiveField(0, defaultValue: 0)
  final int id;

  @HiveField(1, defaultValue: "")
  final String name;

  const BrandHive({
    this.id = 0,
    this.name = "",
  });

  factory BrandHive.convertFrom(BrandModel brandModel) {
    return BrandHive(id: brandModel.id, name: brandModel.name);
  }
}
