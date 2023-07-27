import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/features/home/data/models/category_model.dart';

import '../../data/models/brand_model.dart';

abstract class HomeRepository {
  Future<Either<ResponseErrorModel, List<CategoryModel>>> getCategories(
      {bool forceRefreshFromServer = false});
}
