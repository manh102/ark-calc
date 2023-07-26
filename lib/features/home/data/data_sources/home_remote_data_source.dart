import 'package:new_ark_calc/core/config/common.dart';
import 'package:new_ark_calc/core/error/exceptions.dart';
import 'package:new_ark_calc/core/network/dio_base.dart';
import 'package:new_ark_calc/core/network/task_type.dart';
import 'package:new_ark_calc/features/home/data/models/category_model.dart';
import 'package:new_ark_calc/features/home/data/models/reward_request_model.dart';

import '../models/brand_model.dart';
import '../models/reward_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BrandModel>?> getBrands();

  Future<List<CategoryModel>?> getCategories();

  Future<RewardResponseModel> getExploreRewards(
      {required RewardRequestModel request});

  Future<RewardResponseModel> getMyRewards(
      {required RewardRequestModel request});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final BaseDio baseDio;

  HomeRemoteDataSourceImpl(this.baseDio);

  @override
  Future<List<BrandModel>?> getBrands() async {
    String url = Common.apiBrand;

    final response =
        await baseDio.request<List<BrandModel>>(url, MethodType.GET);

    switch (response.result) {
      case TaskResult.success:
        if (response.error) {
          throw ServerException(
            response.messageCode,
            response.messageContent,
          );
        }
        return response.data!;
      default:
        throw ServerException(
          response.messageCode,
          response.messageContent,
        );
    }
  }

  @override
  Future<RewardResponseModel> getExploreRewards(
      {required RewardRequestModel request}) async {
    String url = Common.apiRewardFilter;

    final response = await baseDio.request<RewardResponseModel>(
        url, MethodType.GET,
        data: request.toJson());

    switch (response.result) {
      case TaskResult.success:
        if (response.error) {
          throw ServerException(
            response.messageCode,
            response.messageContent,
          );
        }
        return response.data!;
      default:
        throw ServerException(
          response.messageCode,
          response.messageContent,
        );
    }
  }

  @override
  Future<RewardResponseModel> getMyRewards(
      {required RewardRequestModel request}) async {
    String url = Common.apiMyReward;

    final response = await baseDio.request<RewardResponseModel>(
        url, MethodType.GET,
        data: request.toJson());

    switch (response.result) {
      case TaskResult.success:
        if (response.error) {
          throw ServerException(
            response.messageCode,
            response.messageContent,
          );
        }
        return response.data!;
      default:
        throw ServerException(
          response.messageCode,
          response.messageContent,
        );
    }
  }

  @override
  Future<List<CategoryModel>?> getCategories() async {
    String url = Common.apiCategory;

    final response =
        await baseDio.request<List<CategoryModel>>(url, MethodType.GET);

    switch (response.result) {
      case TaskResult.success:
        if (response.error) {
          throw ServerException(
            response.messageCode,
            response.messageContent,
          );
        }
        return response.data!;
      default:
        throw ServerException(
          response.messageCode,
          response.messageContent,
        );
    }
  }
}
