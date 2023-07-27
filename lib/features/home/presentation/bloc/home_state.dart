import 'package:equatable/equatable.dart';

import '../../../profile/data/models/user_profile_model.dart';

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

  const Loaded({
    this.userProfileModel,
  });

  @override
  List<Object?> get props => [
        userProfileModel,
      ];
}

class TimeOut extends HomeState {
  final String messageCode;
  final String messageContent;

  TimeOut({required this.messageCode, required this.messageContent});

  @override
  List<Object> get props => [messageCode, messageContent];
}
