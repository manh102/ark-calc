import 'package:new_ark_calc/core/network/dio_base.dart';
import "package:new_ark_calc/features/profile/data/models/user_avatar_request_model.dart";

import "../../../../core/config/common.dart";
import "../../../../core/error/exceptions.dart";
import '../../../../core/network/task_type.dart';
import "../models/user_profile_model.dart";

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel?> getUserProfile();

  Future<bool> updateUserProfile({required UserProfileModel userProfile});

  Future<bool> updateUserAvatar(
      {required UserAvatarRequestModel changeAvatarRequest});

  Future<bool> signOut();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final BaseDio baseDio;

  ProfileRemoteDataSourceImpl(this.baseDio);

  @override
  Future<UserProfileModel?> getUserProfile() async {
    String url = Common.apiProfile;

    final response =
        await baseDio.request<UserProfileModel>(url, MethodType.GET);

    switch (response.result) {
      case TaskResult.success:
        if (response.error) {
          throw ServerException(
            response.messageCode,
            response.messageContent,
          );
        }
        return response.data;
      default:
        throw ServerException(
          response.messageCode,
          response.messageContent,
        );
    }
  }

  @override
  Future<bool> updateUserProfile(
      {required UserProfileModel userProfile}) async {
    String url = Common.apiProfile;

    final response =
        await baseDio.request(url, MethodType.PUT, data: userProfile.toMap());

    switch (response.result) {
      case TaskResult.success:
        if (response.error) {
          throw ServerException(
            response.messageCode,
            response.messageContent,
          );
        }
        return !(response.error);
      default:
        throw ServerException(
          response.messageCode,
          response.messageContent,
        );
    }
  }

  @override
  Future<bool> updateUserAvatar(
      {required UserAvatarRequestModel changeAvatarRequest}) async {
    String url = Common.apiChangeUserAvatar;

    final response =
        await baseDio.uploadFile(url, param: changeAvatarRequest.toMap());

    switch (response.result) {
      case TaskResult.success:
        if (response.error) {
          throw ServerException(
            response.messageCode,
            response.messageContent,
          );
        }
        return !(response.error);
      default:
        throw ServerException(
          response.messageCode,
          response.messageContent,
        );
    }
  }

  @override
  Future<bool> signOut() async {
    String url = Common.apiLogout;

    final response = await baseDio.request(url, MethodType.GET);

    switch (response.result) {
      case TaskResult.success:
        if (response.error) {
          throw ServerException(
            response.messageCode,
            response.messageContent,
          );
        }
        return !(response.error);
      default:
        throw ServerException(
          response.messageCode,
          response.messageContent,
        );
    }
  }
}
