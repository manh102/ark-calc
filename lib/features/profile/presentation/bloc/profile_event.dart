part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  factory ProfileEvent.loadProfile() => ProfileLoadingEvent();

  factory ProfileEvent.updateProfile(
          {required UserProfileModel updatedUserProfile}) =>
      ProfileUpdateEvent(updatedUserProfile: updatedUserProfile);

  factory ProfileEvent.changeAvatar(
          {required UserAvatarRequestModel changeAvatarRequest}) =>
      ProfileChangeAvatarEvent(changeAvatarRequest: changeAvatarRequest);

  factory ProfileEvent.signOut() => ProfileSignOutEvent();

  @override
  List<Object> get props => [];
}

class ProfileLoadingEvent extends ProfileEvent {}

class ProfileUpdateEvent extends ProfileEvent {
  final UserProfileModel updatedUserProfile;

  ProfileUpdateEvent({required this.updatedUserProfile});

  @override
  List<Object> get props => [updatedUserProfile];
}

class ProfileChangeAvatarEvent extends ProfileEvent {
  final UserAvatarRequestModel changeAvatarRequest;

  ProfileChangeAvatarEvent({required this.changeAvatarRequest});

  @override
  List<Object> get props => [changeAvatarRequest];
}

class ProfileSignOutEvent extends ProfileEvent {}