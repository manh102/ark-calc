import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/usecases/usecase_extend.dart';
import 'package:new_ark_calc/features/home/data/models/reward_request_model.dart';
import 'package:new_ark_calc/features/home/data/models/reward_response_model.dart';
import 'package:new_ark_calc/features/home/domain/repositories/home_repository.dart';

class GetExploreRewardsUseCase
    extends UseCaseExtend<RewardResponseModel, RewardRequestModel> {
  final HomeRepository homeRepository;

  GetExploreRewardsUseCase(this.homeRepository);

  @override
  Future<Either<ResponseErrorModel, RewardResponseModel>> call(
      RewardRequestModel requestModel) {
    return homeRepository.getExploreRewards(request: requestModel);
  }
}