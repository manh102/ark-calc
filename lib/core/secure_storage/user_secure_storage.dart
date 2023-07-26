import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:new_ark_calc/core/network/refresh_model.dart';

class UserSecureStorage {
  static final UserSecureStorage instance = UserSecureStorage._internal();
  static const _accessToken = 'accessToken';
  static const _refreshToken = 'refreshToken';
  static const _userId = 'user_id';

  late FlutterSecureStorage _storage;

  UserSecureStorage._internal() {
    _storage = FlutterSecureStorage();
  }

  factory UserSecureStorage() {
    return instance;
  }

  Future<RefreshModel?> getRefreshModel() async {
    String accessToken = await getAccessToken() ?? "";
    String refreshToken = await getRefreshToken() ?? "";

    return RefreshModel(accessToken: accessToken, refreshToken: refreshToken);
  }

  Future<String?> getAccessToken() async =>
      await _storage.read(key: _accessToken);

  Future setAccessToken(String accessToken) async =>
      await _storage.write(key: _accessToken, value: accessToken);

  Future deleteAccessToken() async => _storage.delete(key: _accessToken);

  Future<String?> getRefreshToken() async =>
      await _storage.read(key: _refreshToken);

  Future<void> setRefreshToken(String refreshToken) async =>
      await _storage.write(key: _refreshToken, value: refreshToken);

  Future<void> deleteRefreshToken() async =>
      await _storage.delete(key: _refreshToken);

  Future<String?> getUserId() async => await _storage.read(key: _userId);

  Future<void> setUserId(String userId) async =>
      await _storage.write(key: _userId, value: userId);

  Future<void> deleteUserId() async => await _storage.delete(key: _userId);
}
