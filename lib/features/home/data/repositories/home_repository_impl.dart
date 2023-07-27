import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/extensions/iterable_extension.dart';
import 'package:new_ark_calc/core/util/repository_mixin.dart';
import 'package:new_ark_calc/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:new_ark_calc/features/home/data/models/brand_hive.dart';
import 'package:new_ark_calc/features/home/data/models/brand_model.dart';
import 'package:new_ark_calc/features/home/data/models/category_hive.dart';
import 'package:new_ark_calc/features/home/domain/repositories/home_repository.dart';

import '../data_sources/home_local_data_source.dart';
import '../models/category_model.dart';

class HomeRepositoryImpl extends HomeRepository with RepositoryMixin {
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImpl(this.homeLocalDataSource);

  @override
  Future<Either<ResponseErrorModel, List<CategoryModel>>> getCategories(
      {bool forceRefreshFromServer = false}) {
    return executeTask<List<CategoryModel>>(
      () async {
        final localCategories = await homeLocalDataSource.getLocalCategories();

        return localCategories;
      },
    );
  }
}
