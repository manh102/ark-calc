import 'package:equatable/equatable.dart';

import '../../../profile/data/models/user_profile_model.dart';
import '../../data/models/reward_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

/// This state is used to show the loading indicator when the data is being fetched from the server.
class Loading extends HomeState {}

/// This state is used to show the error message.
class Error extends HomeState {
  final String messageCode;
  final String messageContent;

  Error({required this.messageCode, required this.messageContent});

  @override
  List<Object> get props => [messageCode, messageContent];
}

class Loaded extends HomeState {
  final UserProfileModel? userProfileModel;
  final List<RewardModel> exploreRewards;
  final List<RewardModel> exploreMembershipRewards;
  final List<RewardModel>? myRewards;
  final List<RewardModel>? myMembershipRewards;

  const Loaded({
    this.userProfileModel,
    required this.exploreRewards,
    required this.exploreMembershipRewards,
    this.myRewards,
    this.myMembershipRewards,
  });

  @override
  List<Object?> get props => [
        userProfileModel,
        exploreRewards,
        exploreMembershipRewards,
        myRewards,
        myMembershipRewards
      ];
}

class TimeOut extends HomeState {
  final String messageCode;
  final String messageContent;

  TimeOut({required this.messageCode, required this.messageContent});

  @override
  List<Object> get props => [messageCode, messageContent];
}
