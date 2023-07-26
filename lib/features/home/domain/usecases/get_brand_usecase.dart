import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/usecases/usecase_extend.dart';

import '../../data/models/brand_model.dart';
import '../repositories/home_repository.dart';

class GetBrandUseCase implements UseCaseExtend<List<BrandModel>, bool> {
  final HomeRepository homeRepository;

  GetBrandUseCase(this.homeRepository);

  @override
  Future<Either<ResponseErrorModel, List<BrandModel>>> call(
      bool forceRefreshFromServer) async {
    return await homeRepository.getBrands(
        forceRefreshFromServer: forceRefreshFromServer);
  }
}
