import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/usecases/usecase_extend.dart';
import 'package:new_ark_calc/features/profile/domain/repositories/profile_repository.dart';

class SignOutUseCase extends UseCaseExtend<bool, NoParamsExt> {
  final ProfileRepository profileRepository;

  SignOutUseCase(this.profileRepository);

  @override
  Future<Either<ResponseErrorModel, bool>> call(NoParamsExt params) {
    return profileRepository.logout();
  }
}
