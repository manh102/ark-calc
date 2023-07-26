import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/extensions/iterable_extension.dart';
import 'package:new_ark_calc/core/util/repository_mixin.dart';
import 'package:new_ark_calc/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:new_ark_calc/features/home/data/models/brand_hive.dart';
import 'package:new_ark_calc/features/home/data/models/brand_model.dart';
import 'package:new_ark_calc/features/home/data/models/category_hive.dart';
import 'package:new_ark_calc/features/home/data/models/category_model.dart';
import 'package:new_ark_calc/features/home/data/models/reward_request_model.dart';
import 'package:new_ark_calc/features/home/data/models/reward_response_model.dart';
import 'package:new_ark_calc/features/home/domain/repositories/home_repository.dart';

import '../data_sources/home_local_data_source.dart';

class HomeRepositoryImpl extends HomeRepository with RepositoryMixin {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource, this.homeLocalDataSource);

  @override
  Future<Either<ResponseErrorModel, List<BrandModel>>> getBrands(
      {bool forceRefreshFromServer = false}) async {
    return executeTask<List<BrandModel>>(
      () async {
        final localBrands = await homeLocalDataSource.getLocalBrands();

        if (!forceRefreshFromServer && !localBrands.isNullOrEmpty) {
          return localBrands;
        } else {
          final brandList = await homeRemoteDataSource.getBrands();
          if (brandList != null) {
            final brandHiveList = brandList.mapList(
              (source) => BrandHive.convertFrom(source),
            );
            await homeLocalDataSource.saveBrands(brandHiveList);
          }
          return brandList;
        }
      },
    );
  }

  @override
  Future<Either<ResponseErrorModel, List<CategoryModel>>> getCategories(
      {bool forceRefreshFromServer = false}) {
    return executeTask<List<CategoryModel>>(
      () async {
        final localCategories = await homeLocalDataSource.getLocalCategories();

        if (!forceRefreshFromServer && !localCategories.isNullOrEmpty) {
          return localCategories;
        } else {
          final categoryList = await homeRemoteDataSource.getCategories();
          if (categoryList != null) {
            final categoryHiveList = categoryList.mapList(
              (source) => CategoryHive.convertFrom(source),
            );
            await homeLocalDataSource.saveCategories(categoryHiveList);
          }
          return categoryList;
        }
      },
    );
  }

  @override
  Future<Either<ResponseErrorModel, RewardResponseModel>> getExploreRewards(
      {required RewardRequestModel request}) {
    return executeTask<RewardResponseModel>(
      () async {
        final rewardResponseModel =
            await homeRemoteDataSource.getExploreRewards(request: request);
        return rewardResponseModel;
      },
    );
  }

  @override
  Future<Either<ResponseErrorModel, RewardResponseModel>> getMyRewards(
      {required RewardRequestModel request}) {
    return executeTask<RewardResponseModel>(
      () async {
        final rewardResponseModel =
            await homeRemoteDataSource.getMyRewards(request: request);
        return rewardResponseModel;
      },
    );
  }
}
