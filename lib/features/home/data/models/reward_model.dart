import 'package:equatable/equatable.dart';
import 'package:new_ark_calc/core/extensions/map_extension.dart';

enum RewardApplyCondition {
  membership("Membership"),
  any("Everyone"),
  ;

  final String name;

  const RewardApplyCondition(this.name);
}

class RewardModel extends Equatable {
  /// The unique identifier for the reward
  final int? id;

  /// The name of the reward
  final String? name;

  /// The description of the reward in HTML format
  final String? description;

  /// The name of the category the reward belongs to
  final String? categoryName;

  /// The name of the brand offering the reward
  final String? brandName;

  /// Can the user redeem this reward multiple times? (e.g. "one" or "two")
  final String? option;

  /// The condition under which the reward can be applied (e.g. "any" or "first-time customers only")
  ///
  /// Is this reward exclusive to membership or not?
  final RewardApplyCondition apply;

  /// The membership level required to be eligible for the reward (0 means no membership required)
  final int? membership;

  /// The start date of the reward
  final DateTime? start;

  /// The end date of the reward
  final DateTime? end;

  /// Whether the user has redeemed the reward before
  final bool? hadRedeem;

  /// The cost of the reward in the smallest unit of the currency (e.g. cents for USD)
  final int? price;

  /// The number of rewards available for redemption
  final int? supply;

  /// The URL of the image associated with the reward
  final String? image;

  /// The number of rewards redeemed by users
  final int? sold;

  /// The date and time the reward was created
  final DateTime? createdAt;

  /// Whether the user has liked the reward or not
  final bool? isLiked;

  final String? redeemCode;

  RewardModel(
      {this.id,
      this.name,
      this.description,
      this.categoryName,
      this.brandName,
      this.option,
      this.apply = RewardApplyCondition.any,
      this.membership,
      this.start,
      this.end,
      this.hadRedeem,
      this.price,
      this.supply,
      this.image,
      this.sold,
      this.createdAt,
      this.isLiked,
      this.redeemCode});

  factory RewardModel.fromMap(Map<String, dynamic> map) {
    return RewardModel(
      id: map.find<int?>("id", (value) => value),
      name: map['name'] as String? ?? "",
      description: map['description'] as String? ?? "",
      categoryName: map['category_name'] as String? ?? "",
      brandName: map['brand_name'] as String? ?? "",
      option: map['option'] as String? ?? "",
      apply: RewardApplyCondition.values.byName(map['apply'] as String? ?? ""),
      membership: map['membership'] as int? ?? 0,
      start: DateTime.parse(map['start'] as String? ?? ''),
      end: DateTime.parse(map['end'] as String? ?? ''),
      hadRedeem: map['has_redeem'] as bool?,
      price: map['price'] as int?,
      supply: map['supply'] as int?,
      image: map['image'] as String?,
      sold: map['sold'] as int?,
      createdAt: DateTime.parse(map['created_at'] as String? ?? ''),
      isLiked: map['is_like'] as bool?,
      redeemCode: map['redeem_code'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category_name': categoryName,
      'brand_name': brandName,
      'option': option,
      'apply': apply,
      'membership': membership,
      'start': start?.toIso8601String(),
      'end': end?.toIso8601String(),
      'has_redeem': hadRedeem,
      'price': price,
      'supply': supply,
      'image': image,
      'sold': sold,
      'created_at': createdAt?.toIso8601String(),
      'is_like': isLiked,
      'redeem_code': redeemCode
    };
  }

  String formattedStart() {
    return "${start?.day}/${start?.month}/${start?.year}";
  }

  String formattedEnd() {
    return "${end?.day}/${end?.month}/${end?.year}";
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        categoryName,
        brandName,
        option,
        apply,
        membership,
        start,
        end,
        hadRedeem,
        price,
        supply,
        image,
        sold,
        createdAt,
        isLiked,
        redeemCode,
      ];
}
