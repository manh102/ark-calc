import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/usecases/usecase_extend.dart';
import 'package:new_ark_calc/features/profile/data/models/user_avatar_request_model.dart';
import 'package:new_ark_calc/features/profile/data/models/user_profile_model.dart';

import '../../../../core/util/logger_util.dart';
import '../../domain/use_cases/get_profile_use_case.dart';
import '../../domain/use_cases/update_profile_use_case.dart';
import '../../domain/use_cases/change_user_avatar_use_case.dart';
import '../../domain/use_cases/sign_out_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final ChangeUserAvatarUseCase changeUserAvatarUseCase;
  final SignOutUseCase signOutUseCase;

  ProfileBloc(this.getProfileUseCase, this.updateProfileUseCase,
      this.changeUserAvatarUseCase, this.signOutUseCase)
      : super(Empty()) {
    on<ProfileLoadingEvent>(_onLoadUserProfile);

    on<ProfileUpdateEvent>(_onUpdateUserProfile);

    on<ProfileChangeAvatarEvent>(_onChangeUserAvatar);

    on<ProfileSignOutEvent>(_onSignOut);
  }

  Future _onLoadUserProfile(
      ProfileLoadingEvent event, Emitter<ProfileState> emit) async {
    emit(Loading());
    try {
      final response = await getProfileUseCase.call(NoParamsExt());

      response.fold((responseFail) async {
        Logging.log.warn(responseFail.msgContent);

        if (responseFail.isTimeOut) {
          emit(TimeOut(
              messageCode: responseFail.msgCode,
              messageContent: responseFail.msgContent));
        } else {
          emit(Error(
              messageCode: responseFail.msgCode,
              messageContent: responseFail.msgContent));
        }
        return false;
      }, (responseSuccess) {
        emit(Loaded(responseSuccess));
        return true;
      });
    } catch (ex) {
      Logging.log.info(ex.toString());
      emit(Error(messageCode: "", messageContent: "Error"));
      return false;
    }
  }

  Future _onUpdateUserProfile(
      ProfileUpdateEvent event, Emitter<ProfileState> emit) async {
    emit(Loading());
    try {
      final response =
          await updateProfileUseCase.call(event.updatedUserProfile);

      response.fold((responseFail) async {
        Logging.log.warn(responseFail.msgContent);

        if (responseFail.isTimeOut) {
          emit(TimeOut(
              messageCode: responseFail.msgCode,
              messageContent: responseFail.msgContent));
        } else {
          emit(Error(
              messageCode: responseFail.msgCode,
              messageContent: responseFail.msgContent));
        }
        return false;
      }, (responseSuccess) {
        emit(Updated());
        return true;
      });
    } catch (ex) {
      Logging.log.info(ex.toString());
      emit(Error(messageCode: "", messageContent: "Error"));
      return false;
    }
  }

  Future _onChangeUserAvatar(
      ProfileChangeAvatarEvent event, Emitter<ProfileState> emit) async {
    emit(Loading());
    try {
      final response =
          await changeUserAvatarUseCase.call(event.changeAvatarRequest);

      await response.fold((responseFail) async {
        Logging.log.warn(responseFail.msgContent);

        if (responseFail.isTimeOut) {
          emit(TimeOut(
              messageCode: responseFail.msgCode,
              messageContent: responseFail.msgContent));
        } else {
          emit(Error(
              messageCode: responseFail.msgCode,
              messageContent: responseFail.msgContent));
        }
        return false;
      }, (responseSuccess) {
        emit(UserAvatarChanged());
        return true;
      });
    } catch (ex) {
      Logging.log.info(ex.toString());
      emit(Error(messageCode: "", messageContent: "Error"));
      return false;
    }
  }

  Future _onSignOut(
      ProfileSignOutEvent event, Emitter<ProfileState> emit) async {
    emit(Loading());
    try {
      final response = await signOutUseCase.call(NoParamsExt());

      response.fold((responseFail) async {
        Logging.log.warn(responseFail.msgContent);

        if (responseFail.isTimeOut) {
          emit(TimeOut(
              messageCode: responseFail.msgCode,
              messageContent: responseFail.msgContent));
        } else {
          emit(Error(
              messageCode: responseFail.msgCode,
              messageContent: responseFail.msgContent));
        }
        return false;
      }, (responseSuccess) async {
        emit(SignedOut());
        return true;
      });
    } catch (ex) {
      Logging.log.info(ex.toString());
      emit(Error(messageCode: "", messageContent: "Error"));
      return false;
    }
  }
}
