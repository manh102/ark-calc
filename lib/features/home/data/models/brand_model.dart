import 'package:equatable/equatable.dart';
import 'package:new_ark_calc/features/home/data/models/brand_hive.dart';

class BrandModel extends Equatable {
  final int id;
  final String name;

  BrandModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'],
      name: map['name'],
    );
  }

  factory BrandModel.fromHive(BrandHive brandHive) {
    return BrandModel(
      id: brandHive.id,
      name: brandHive.name,
    );
  }

  BrandModel copyWith({int? id, String? name}) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
