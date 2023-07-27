import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/usecases/usecase_extend.dart';
import 'package:new_ark_calc/core/util/core_util.dart';
import 'package:new_ark_calc/features/home/domain/usecases/get_category_usecase.dart';

import '../../../profile/data/models/user_profile_model.dart';
import '../../../profile/domain/use_cases/get_profile_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategoryUseCase getCategoryUseCase;
  final GetProfileUseCase getProfileUseCase;

  HomeBloc({required this.getCategoryUseCase, required this.getProfileUseCase})
      : super(HomeInitial()) {
    on<GetCategoriesEvent>(_getCategoriesList);

    on<HomeInitialEvent>(_onLoadInitialData);

    on<HomeIdleEvent>(
      (event, emit) => HomeInitial(),
    );
  }

  Future _getCategoriesList(
      GetCategoriesEvent event, Emitter<HomeState> emit) async {
    try {
      final result = await getCategoryUseCase.call(true);

      await result.fold((responseFail) async {
        Logging.log
            .info("${responseFail.msgCode} : ${responseFail.msgContent}");
        return false;
      }, (responseSuccess) async {
        return true;
      });
    } catch (ex) {
      Logging.log.info(ex.toString());
      return false;
    }
  }

  Future _onLoadInitialData(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    // emit(Loading());
    // try {
    //   UserProfileModel? userProfileData;
    //   if (event.isLoggedIn) {
    //     userProfileData = await _onLoadUserProfile(event, emit);
    //   }

    //   final exploreRewardResponse = await getExploreRewardsUseCase
    //       .call(RewardRequestModel.createRequestForHomePage());

    //   RewardResponseModel? Function(ResponseErrorModel) ifErrorOccurred =
    //       (responseErrorModel) {
    //     Logging.log.warn(responseErrorModel.msgContent);

    //     if (responseErrorModel.isTimeOut) {
    //       emit(TimeOut(
    //           messageCode: responseErrorModel.msgCode,
    //           messageContent: responseErrorModel.msgContent));
    //     } else {
    //       emit(Error(
    //           messageCode: responseErrorModel.msgCode,
    //           messageContent: responseErrorModel.msgContent));
    //     }
    //     return null;
    //   };

    //   var exploreRewardData = exploreRewardResponse
    //       .fold<RewardResponseModel?>(ifErrorOccurred, (rewardResponseModel) {
    //     return rewardResponseModel;
    //   });

    //   RewardResponseModel? myRewardData;
    //   if (!(userProfileData?.isNoRewardOrMembership ?? true)) {
    //     final myRewardResponse = await getMyRewardsUseCase
    //         .call(RewardRequestModel.createRequestForHomePage());
    //     myRewardData = myRewardResponse
    //         .fold<RewardResponseModel?>(ifErrorOccurred, (rewardResponseModel) {
    //       return rewardResponseModel;
    //     });
    //   }

    //   emit(Loaded(
    //       userProfileModel: userProfileData,
    //       myRewards: myRewardData?.reward,
    //       myMembershipRewards: myRewardData?.membership,
    //       exploreRewards: exploreRewardData?.reward ?? [],
    //       exploreMembershipRewards: exploreRewardData?.membership ?? []));
    //   return true;
    // } catch (ex) {
    //   Logging.log.info(ex.toString());
    //   emit(Error(messageCode: "", messageContent: "Error"));
    //   return false;
    // }
  }

  Future<UserProfileModel?> _onLoadUserProfile(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    try {
      var getUserProfileResponse = await getProfileUseCase.call(NoParamsExt());

      return getUserProfileResponse.fold((responseErrorModel) {
        Logging.log.warn(responseErrorModel.msgContent);

        if (responseErrorModel.isTimeOut) {
          emit(TimeOut(
              messageCode: responseErrorModel.msgCode,
              messageContent: responseErrorModel.msgContent));
        } else {
          emit(Error(
              messageCode: responseErrorModel.msgCode,
              messageContent: responseErrorModel.msgContent));
        }
        return null;
      }, (userProfileResponse) {
        return userProfileResponse;
      });
    } catch (ex) {
      Logging.log.info(ex.toString());
      emit(Error(messageCode: "", messageContent: "Error"));
    }
    return null;
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
