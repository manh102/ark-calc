part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class Empty extends ProfileState {}

class Initial extends ProfileState {}

class Loading extends ProfileState {}

class Loaded extends ProfileState {
  final UserProfileModel retrievedUserProfile;

  Loaded(this.retrievedUserProfile);

  @override
  List<Object> get props => [retrievedUserProfile];
}

class Updated extends ProfileState {}

class TimeOut extends ProfileState {
  final String messageCode;
  final String messageContent;

  TimeOut({required this.messageCode, required this.messageContent});

  @override
  List<Object> get props => [messageCode, messageContent];
}

class Error extends ProfileState {
  final String messageCode;
  final String messageContent;

  Error({required this.messageCode, required this.messageContent});

  @override
  List<Object> get props => [messageCode, messageContent];
}

class UserAvatarChanged extends ProfileState {}

class SignedOut extends ProfileState {}