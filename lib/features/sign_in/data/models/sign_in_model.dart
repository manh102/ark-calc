import 'package:equatable/equatable.dart';

class SignInModel extends Equatable {
  final String token;
  final String refresh;
  final int userId;

  const SignInModel(
      {required this.token, required this.refresh, required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'token': this.token,
      'refresh': this.refresh,
      'user_id': this.userId
    };
  }

  factory SignInModel.fromMap(Map<String, dynamic> map) {
    return SignInModel(
      token: map['token'] as String,
      refresh: map['refresh'] as String,
      userId: map['user_id'] as int,
    );
  }

  @override
  String toString() {
    return 'SignInModel{token: $token, refresh: $refresh, userId: $userId}';
  }

  @override
  List<Object?> get props => [token, refresh, userId];
}
