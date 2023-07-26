import 'package:new_ark_calc/core/extensions/optional_extension.dart';
import 'package:new_ark_calc/core/extensions/shared_preferences_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/profile/data/models/user_profile_model.dart';
import '../constants/user_profile_const.dart';

class BaseStorage {
  static BaseStorage instance = BaseStorage._internal();

  late SharedPreferences prefs;

  factory BaseStorage() {
    return instance;
  }

  BaseStorage._internal();

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveUserProfile(UserProfileModel userProfileModel) async {
    await prefs.setValue(UserProfileConst.keyName, userProfileModel.name);
    await prefs.setValue(UserProfileConst.keyEmail, userProfileModel.email);
    await prefs.setValue(UserProfileConst.keyPhone, userProfileModel.phone);
    await prefs.setValue(
        UserProfileConst.keyBirthday, userProfileModel.birthday.orDefault);
    await prefs.setValue(
        UserProfileConst.keyLocation, userProfileModel.location.orDefault);
    await prefs.setValue(
        UserProfileConst.keyBeans, userProfileModel.beans.orDefault);
    await prefs.setValue(
        UserProfileConst.keyLevel, userProfileModel.level.orDefault);
    await prefs.setValue(
        UserProfileConst.keyRedemption, userProfileModel.redemption.orDefault);
  }

  Future<UserProfileModel> getSavedUserProfile() async {
    return UserProfileModel(
      name: prefs.getOrElse(UserProfileConst.keyName, defaultValue: ""),
      email: prefs.getOrElse(UserProfileConst.keyEmail, defaultValue: ""),
      phone: prefs.getOrElse(UserProfileConst.keyPhone, defaultValue: ""),
      birthday: prefs.getOrElse(UserProfileConst.keyBirthday, defaultValue: ""),
      beans: prefs.getOrElse(UserProfileConst.keyBeans, defaultValue: 0),
      level: prefs.getOrElse(UserProfileConst.keyLevel, defaultValue: ""),
      location: prefs.getOrElse(UserProfileConst.keyLocation, defaultValue: ""),
      redemption:
          prefs.getOrElse(UserProfileConst.keyRedemption, defaultValue: 0),
    );
  }

  int getCurrentBeans() =>
      prefs.getOrElse(UserProfileConst.keyBeans, defaultValue: 0);

  int getCurrentRedemption() =>
      prefs.getOrElse(UserProfileConst.keyRedemption, defaultValue: 0);
}
