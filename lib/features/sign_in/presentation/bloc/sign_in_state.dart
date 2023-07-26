import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

/// This state is used to show the loading indicator when the phone number is being sent to the server for verification and the user is being redirected to the verification page.
class SignInLoading extends SignInState {}

/// This state is used to show the error message.
class SignInError extends SignInState {
  final String messageCode;
  final String messageContent;

  SignInError({required this.messageCode, required this.messageContent});

  @override
  List<Object> get props => [messageCode, messageContent];
}

/// This state indicates that verification is completed and the user is being redirected to the home page.
class SignInPhoneAuthVerified extends SignInState {}

class SignInOtpCodeSentSuccess extends SignInState {
  final String? verificationId;

  const SignInOtpCodeSentSuccess({
    required this.verificationId,
  });

  @override
  List<Object?> get props => [verificationId];
}