import 'package:equatable/equatable.dart';
import 'package:new_ark_calc/core/extensions/optional_extension.dart';

class UserProfileModel extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String? birthday;
  final String? location;
  final int? beans;
  final String? level;
  final int? redemption;
  final String? avatar;

  factory UserProfileModel.empty() {
    return UserProfileModel(name: "", email: "", phone: "");
  }

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        birthday,
        location,
        beans,
        level,
        redemption,
        avatar
      ];

  const UserProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    this.birthday,
    this.location,
    this.beans,
    this.level,
    this.redemption,
    this.avatar,
  });

  UserProfileModel copyWith({
    int? userId,
    String? name,
    String? email,
    String? phone,
    String? birthday,
    String? location,
    int? beans,
    String? level,
    int? redemption,
    String? avatar,
  }) {
    return UserProfileModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
      location: location ?? this.location,
      beans: beans ?? this.beans,
      level: level ?? this.level,
      redemption: redemption ?? this.redemption,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  String toString() {
    return 'UserProfileModel{name: $name, email: $email, phone: $phone, birthday: $birthday, location: $location, beans: $beans, level: $level, redemption: $redemption, avatar: $avatar}';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'phone': this.phone,
      'birthday': this.birthday,
      'location': this.location,
      'beans': this.beans,
      'level': this.level,
      'redemption': this.redemption,
      'avatar': this.avatar,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    final userMap = map['user'] as Map<String, dynamic>;
    return UserProfileModel(
        name: userMap['name'] ?? "",
        email: userMap['email'] ?? "",
        phone: userMap['phone'] ?? "",
        birthday: userMap['birthday'] ?? "",
        location: userMap['location'] ?? "",
        beans: userMap['beans'] ?? "",
        level: userMap['level'] ?? "",
        redemption: userMap['redemption'] ?? 0,
        avatar: userMap['avatar'] ?? "");
  }
}

extension UserProfileModelExt on UserProfileModel? {
  bool get isNoRewardOrMembership =>
      this?.beans.orDefault == 0 || this?.redemption.orDefault == 0;
}
