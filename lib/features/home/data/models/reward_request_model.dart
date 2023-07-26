import 'package:new_ark_calc/core/constants/common_const.dart';
import 'package:new_ark_calc/features/home/data/models/brand_model.dart';

import 'category_model.dart';

/// A model representing the request parameters for fetching rewards.
class RewardRequestModel {
  /// The value indicating whether or not to include out of stock rewards (0 = exclude, 1 = include)
  final int outOfStock;

  /// The type of rewards to fetch (null = fetch all, "reward" = fetch only reward type, "membership" = fetch only membership type)
  final String? take;

  /// The name of the column to order the results by (e.g. "date", "price",)
  final String orderBy;

  /// The sort order for the results (e.g. "asc" for ascending, "desc" for descending)
  final String order;

  /// The IDs of the categories to filter the results by, splitting by <,> (null = fetch all categories)
  ///
  /// Example: 23, 12
  final String? categoryId;

  /// The IDs of the brands to filter the results by, splitting by <,> (null = fetch all brands)
  final String? brandId;

  /// The page number to fetch (null = fetch the first page)
  final int? page;

  /// The maximum number of results to fetch per page
  final int limit;

  factory RewardRequestModel.createRequestForHomePage() {
    return RewardRequestModel(
        outOfStock: 1,
        orderBy: "date",
        order: "desc",
        limit: CommonConst.kDefaultHomeTabPageSize);
  }

  factory RewardRequestModel.createRequestForInitRedeemPage({String? take}) {
    return RewardRequestModel(
        take: take,
        outOfStock: 1,
        orderBy: "date",
        order: "desc",
        limit: CommonConst.kDefaultRedeemTabPageSize,
        page: 1);
  }

  factory RewardRequestModel.fromJson(Map<String, dynamic> json) {
    return RewardRequestModel(
      outOfStock: json['out_of_stock'] ?? 0,
      take: json['take'],
      orderBy: json['order_by'],
      order: json['order'],
      categoryId: json['category_id'],
      brandId: json['brand_id'],
      page: json['page'],
      limit: json['limit'] ?? 10,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'out_of_stock': outOfStock,
      'order_by': orderBy,
      'order': order,
      'limit': limit,
    };
    if (take != null) {
      data['take'] = take;
    }
    if (categoryId != null) {
      data['category_id'] = categoryId;
    }
    if (brandId != null) {
      data['brand_id'] = brandId;
    }
    if (page != null) {
      data['page'] = page;
    }
    return data;
  }

//<editor-fold desc="Data Methods">
  const RewardRequestModel({
    required this.outOfStock,
    this.take,
    required this.orderBy,
    required this.order,
    this.categoryId,
    this.brandId,
    this.page,
    required this.limit,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RewardRequestModel &&
          runtimeType == other.runtimeType &&
          outOfStock == other.outOfStock &&
          take == other.take &&
          orderBy == other.orderBy &&
          order == other.order &&
          categoryId == other.categoryId &&
          brandId == other.brandId &&
          page == other.page &&
          limit == other.limit);

  @override
  int get hashCode =>
      outOfStock.hashCode ^
      take.hashCode ^
      orderBy.hashCode ^
      order.hashCode ^
      categoryId.hashCode ^
      brandId.hashCode ^
      page.hashCode ^
      limit.hashCode;

  @override
  String toString() {
    return 'RewardRequestModel{' +
        ' outOfStock: $outOfStock,' +
        ' take: $take,' +
        ' orderBy: $orderBy,' +
        ' order: $order,' +
        ' categoryId: $categoryId,' +
        ' brandId: $brandId,' +
        ' page: $page,' +
        ' limit: $limit,' +
        '}';
  }

  RewardRequestModel copyWith({
    int? outOfStock,
    String? take,
    String? orderBy,
    String? order,
    String? categoryId,
    String? brandId,
    int? page,
    int? limit,
  }) {
    return RewardRequestModel(
      outOfStock: outOfStock ?? this.outOfStock,
      take: take ?? this.take,
      orderBy: orderBy ?? this.orderBy,
      order: order ?? this.order,
      categoryId: categoryId ?? this.categoryId,
      brandId: brandId ?? this.brandId,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'outOfStock': this.outOfStock,
      'take': this.take,
      'orderBy': this.orderBy,
      'order': this.order,
      'categoryId': this.categoryId,
      'brandId': this.brandId,
      'page': this.page,
      'limit': this.limit,
    };
  }

  factory RewardRequestModel.fromMap(Map<String, dynamic> map) {
    return RewardRequestModel(
      outOfStock: map['outOfStock'] as int,
      take: map['take'] as String,
      orderBy: map['orderBy'] as String,
      order: map['order'] as String,
      categoryId: map['categoryId'] as String,
      brandId: map['brandId'] as String,
      page: map['page'] as int,
      limit: map['limit'] as int,
    );
  }

//</editor-fold>
}

extension RewardRequestModelExt on RewardRequestModel {
  bool get includeOutOfStock => this.outOfStock == 1;

  bool get includeFilterByDate => this.orderBy == "date";

  static String getCategoryId(
      List<CategoryModel> categoryList, Set<int>? selectedCategories) {
    if (selectedCategories == null) return "";
    List<CategoryModel> selectedCategoryList = [];
    for (int i = 0; i < categoryList.length; i++) {
      if (selectedCategories.contains(i)) {
        selectedCategoryList.add(categoryList[i]);
      }
    }
    return selectedCategoryList.map((e) => e.id).join(",");
  }

  static String getBrandId(
      List<BrandModel> brandList, Set<int>? selectedBrandIndexes) {
    if (selectedBrandIndexes == null) return "";
    List<BrandModel> selectedBrandList = [];
    for (int i = 0; i < brandList.length; i++) {
      if (selectedBrandIndexes.contains(i)) {
        selectedBrandList.add(brandList[i]);
      }
    }
    return selectedBrandList.map((e) => e.id).join(",");
  }

  static String? getOrderByCondition({
    required bool? newlyAddedSortDesc,
    required bool? sortByPriceDesc,
  }) {
    if (newlyAddedSortDesc == null && sortByPriceDesc == null) {
      return null;
    }

    if (newlyAddedSortDesc != null) {
      return "date";
    } else {
      return "price";
    }
  }

  static String? getOrderCondition({
    required bool? newlyAddedSortDesc,
    required bool? sortByPriceDesc,
  }) {
    if (newlyAddedSortDesc == null && sortByPriceDesc == null) {
      return null;
    }

    if (newlyAddedSortDesc != null) {
      return newlyAddedSortDesc ? "desc" : "asc";
    }

    if (sortByPriceDesc != null) {
      return sortByPriceDesc ? "desc" : "asc";
    }

    return null;
  }
}
