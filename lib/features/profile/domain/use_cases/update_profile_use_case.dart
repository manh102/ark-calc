import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/usecases/usecase_extend.dart';
import 'package:new_ark_calc/features/profile/data/models/user_profile_model.dart';
import 'package:new_ark_calc/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase extends UseCaseExtend<bool, UserProfileModel> {
  final ProfileRepository profileRepository;

  UpdateProfileUseCase(this.profileRepository);

  @override
  Future<Either<ResponseErrorModel, bool>> call(UserProfileModel params) async {
    return profileRepository.updateUserProfile(userProfile: params);
  }
}
