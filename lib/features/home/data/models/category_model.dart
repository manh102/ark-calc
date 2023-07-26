import 'package:equatable/equatable.dart';
import 'package:new_ark_calc/features/home/data/models/category_hive.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;

  CategoryModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
    );
  }

  factory CategoryModel.fromHive(CategoryHive categoryHive) {
    return CategoryModel(
      id: categoryHive.id,
      name: categoryHive.name,
    );
  }

  CategoryModel copyWith({int? id, String? name}) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
