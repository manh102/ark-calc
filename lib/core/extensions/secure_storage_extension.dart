import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

extension SharedPreferencesExtension on FlutterSecureStorage {
  Type _typeOf<T>() => T;

  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  ///
  /// If the value is null, return the [defaultValue]
  Future<T> getOrElse<T extends Object>(String key, {required T defaultValue}) async {
    if (T == double) {
      return await getDoubleOrElse(key, defaultValue: defaultValue as double) as T;
    } else if (T == int) {
      return await getIntOrElse(key, defaultValue: defaultValue as int) as T;
    } else if (T == String) {
      return await getStringOrElse(key, defaultValue: defaultValue as String) as T;
    } else if (T == bool) {
      return await getBoolOrElse(key, defaultValue: defaultValue as bool) as T;
    } else if (T == _typeOf<Map<String, dynamic>>()) {
      return await getJsonOrElse(key,
          defaultValue: defaultValue as Map<String, dynamic>) as T;
    } else if (T == DateTime) {
      return await getDateTimeOrElse(key, defaultValue: defaultValue as DateTime)
          as T;
    }
    throw ArgumentError(
        'The $T type is incompatible - Use only double, int, String, bool, List<String>, '
        'Map<String, dynamic>, ThemeMode, Color or DateTime');
  }

  /// Writes a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  Future<void> setValue<T extends Object>(String key, T value) {
    if (value is double) {
      return this.write(key: key, value: value.toString());
    } else if (value is int) {
      return this.write(key: key, value: value.toString());
    } else if (value is String) {
      return this.write(key: key, value: value);
    } else if (value is bool) {
      return this.write(key: key, value: value.toString());
    } else if (value is Map<String, dynamic>) {
      return setJson(key, value);
    } else if (value is DateTime) {
      return setDateTime(key, value);
    }

    throw ArgumentError(
        'The $T type is incompatible - Use only double, int, String, bool, List<String>, '
        'Map<String, dynamic>, ThemeMode, Color or DateTime');
  }

  Future<void> setJson(String key, Map<String, dynamic> map) =>
      this.write(key: key, value: jsonEncode(map));

  /// Stores values as timezone independent milliseconds
  /// from the standard Unix epoch.
  Future<void> setDateTime(String key, DateTime dateTime) =>
      this.write(key: key, value: dateTime.millisecondsSinceEpoch.toString());

  Future<Map<String, dynamic>?> getJson(String key) async {
    final value = await this.read(key: key);
    return value != null ? jsonDecode(value) as Map<String, dynamic> : null;
  }

  Future<DateTime?> getDateTime(String key) async {
    final value = await this.read(key: key);
    return value != null
        ? DateTime.fromMillisecondsSinceEpoch(int.parse(value), isUtc: true)
        : null;
  }

  Future<bool> getBoolOrElse(String key, {required bool defaultValue}) async {
    String? value = await this.read(key: key);
    return (value ?? defaultValue) == "true" ? true : false;
  }

  Future<int> getIntOrElse(String key, {required int defaultValue}) async {
    String? value = await this.read(key: key);
    return int.tryParse(value ?? "") ?? defaultValue;
  }

  Future<double> getDoubleOrElse(String key,
      {required double defaultValue}) async {
    String? value = await this.read(key: key);
    return double.tryParse(value ?? "") ?? defaultValue;
  }

  Future<String> getStringOrElse(String key,
      {required String defaultValue}) async {
    String? value = await this.read(key: key);
    return value ?? defaultValue;
  }

  Future<Map<String, dynamic>?> getJsonOrElse(String key,
      {required Map<String, dynamic> defaultValue}) async {
    return await getJson(key) ?? defaultValue;
  }

  Future<DateTime> getDateTimeOrElse(String key,
          {required DateTime defaultValue}) async =>
      await getDateTime(key) ?? defaultValue;
}
