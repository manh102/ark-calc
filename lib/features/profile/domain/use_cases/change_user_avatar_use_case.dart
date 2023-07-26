import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/usecases/usecase_extend.dart';
import 'package:new_ark_calc/features/profile/data/models/user_avatar_request_model.dart';
import 'package:new_ark_calc/features/profile/domain/repositories/profile_repository.dart';

class ChangeUserAvatarUseCase
    extends UseCaseExtend<bool, UserAvatarRequestModel> {
  final ProfileRepository profileRepository;

  ChangeUserAvatarUseCase(this.profileRepository);

  @override
  Future<Either<ResponseErrorModel, bool>> call(
      UserAvatarRequestModel params) async {
    return await profileRepository.changeUserAvatarProfile(
        changeAvatarRequest: params);
  }
}
