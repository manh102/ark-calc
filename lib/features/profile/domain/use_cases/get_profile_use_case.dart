import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/usecases/usecase_extend.dart';
import 'package:new_ark_calc/features/profile/data/models/user_profile_model.dart';
import 'package:new_ark_calc/features/profile/domain/repositories/profile_repository.dart';

class GetProfileUseCase extends UseCaseExtend<UserProfileModel, NoParamsExt> {
  final ProfileRepository profileRepository;

  GetProfileUseCase(this.profileRepository);

  @override
  Future<Either<ResponseErrorModel, UserProfileModel>> call(
      NoParamsExt params) async {
    return await profileRepository.getUserProfile();
  }
}
