import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/usecases/usecase_extend.dart';
import 'package:new_ark_calc/features/home/data/models/category_model.dart';

import '../repositories/home_repository.dart';

class GetCategoryUseCase implements UseCaseExtend<List<CategoryModel>, bool> {
  final HomeRepository homeRepository;

  GetCategoryUseCase(this.homeRepository);

  @override
  Future<Either<ResponseErrorModel, List<CategoryModel>>> call(
      bool forceRefreshFromServer) {
    return homeRepository.getCategories(
        forceRefreshFromServer: forceRefreshFromServer);
  }
}
