import 'package:json_annotation/json_annotation.dart';
import 'package:arklevelcalculator/schema/user.dart';

part 'user_login.g.dart';

@JsonSerializable()
class UserLogin {
  String access_token;
  User user;

  UserLogin({
    this.access_token,
    this.user,
  });

  static const classType = 'UserLogin';

  factory UserLogin.fromJson(Map<String, dynamic> json) =>
      _$UserLoginFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
}
