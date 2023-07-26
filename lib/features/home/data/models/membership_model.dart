import 'package:equatable/equatable.dart';

class Membership extends Equatable {
  final int id;
  final String name;
  final String description;
  final String categoryName;
  final String brandName;
  final String option;
  final String apply;
  final DateTime start;
  final DateTime end;
  final int price;
  final int supply;
  final String image;
  final int sold;
  final DateTime createdAt;
  final bool isLike;

  Membership({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryName,
    required this.brandName,
    required this.option,
    required this.apply,
    required this.start,
    required this.end,
    required this.price,
    required this.supply,
    required this.image,
    required this.sold,
    required this.createdAt,
    required this.isLike,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        categoryName,
        brandName,
        option,
        apply,
        start,
        end,
        price,
        supply,
        image,
        sold,
        createdAt,
        isLike,
      ];

  factory Membership.fromMap(Map<String, dynamic> map) {
    return Membership(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      categoryName: map['category_name'],
      brandName: map['brand_name'],
      option: map['option'],
      apply: map['apply'],
      start: DateTime.parse(map['start']),
      end: DateTime.parse(map['end']),
      price: map['price'],
      supply: map['supply'],
      image: map['image'],
      sold: map['sold'],
      createdAt: DateTime.parse(map['created_at']),
      isLike: map['is_like'],
    );
  }

  Membership copyWith({
    int? id,
    String? name,
    String? description,
    String? categoryName,
    String? brandName,
    String? option,
    String? apply,
    DateTime? start,
    DateTime? end,
    int? price,
    int? supply,
    String? image,
    int? sold,
    DateTime? createdAt,
    bool? isLike,
  }) {
    return Membership(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      categoryName: categoryName ?? this.categoryName,
      brandName: brandName ?? this.brandName,
      option: option ?? this.option,
      apply: apply ?? this.apply,
      start: start ?? this.start,
      end: end ?? this.end,
      price: price ?? this.price,
      supply: supply ?? this.supply,
      image: image ?? this.image,
      sold: sold ?? this.sold,
      createdAt: createdAt ?? this.createdAt,
      isLike: isLike ?? this.isLike,
    );
  }

  String formattedStart() {
    return "${start.day}/${start.month}/${start.year}";
  }

  String formattedEnd() {
    return "${end.day}/${end.month}/${end.year}";
  }
}
