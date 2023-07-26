import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/features/profile/data/models/user_avatar_request_model.dart';
import 'package:new_ark_calc/features/profile/data/models/user_profile_model.dart';

import '../../../../core/error/error_model.dart';

abstract class ProfileRepository {
  Future<Either<ResponseErrorModel, UserProfileModel>> getUserProfile();

  Future<Either<ResponseErrorModel, bool>> updateUserProfile(
      {required UserProfileModel userProfile});

  Future<Either<ResponseErrorModel, bool>> changeUserAvatarProfile(
      {required UserAvatarRequestModel changeAvatarRequest});

  Future<Either<ResponseErrorModel, bool>> logout();
}
