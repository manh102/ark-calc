import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/secure_storage/share_preferences.dart';
import 'package:new_ark_calc/core/util/repository_mixin.dart';
import 'package:new_ark_calc/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:new_ark_calc/features/profile/data/models/user_avatar_request_model.dart';
import 'package:new_ark_calc/features/profile/data/models/user_profile_model.dart';
import 'package:new_ark_calc/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository with RepositoryMixin {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl(this.profileRemoteDataSource);

  @override
  Future<Either<ResponseErrorModel, UserProfileModel>> getUserProfile() {
    return executeTask<UserProfileModel>(
      () async {
        final userProfileModel = await profileRemoteDataSource.getUserProfile();
        if (userProfileModel != null) {
          await BaseStorage.instance.saveUserProfile(userProfileModel);
        }
        return userProfileModel;
      },
    );
  }

  @override
  Future<Either<ResponseErrorModel, bool>> updateUserProfile(
      {required UserProfileModel userProfile}) {
    return executeTask<bool>(
      () async {
        return await profileRemoteDataSource.updateUserProfile(
            userProfile: userProfile);
      },
    );
  }

  @override
  Future<Either<ResponseErrorModel, bool>> changeUserAvatarProfile(
      {required UserAvatarRequestModel changeAvatarRequest}) {
    return executeTask<bool>(
      () async {
        return await profileRemoteDataSource.updateUserAvatar(
            changeAvatarRequest: changeAvatarRequest);
      },
    );
  }

  @override
  Future<Either<ResponseErrorModel, bool>> logout() {
    return executeTask<bool>(
      () async {
        return await profileRemoteDataSource.signOut();
      },
    );
  }
}
