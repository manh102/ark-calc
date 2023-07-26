import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

extension SharedPreferencesExtension on SharedPreferences {
  Type _typeOf<T>() => T;

  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  T? getValue<T extends Object>(String key) {
    if (T == double) {
      return getDouble(key) as T?;
    } else if (T == int) {
      return getInt(key) as T?;
    } else if (T == String) {
      return getString(key) as T?;
    } else if (_typeOf<List<String>>() == T) {
      return getStringList(key) as T?;
    } else if (T == bool) {
      return getBool(key) as T?;
    } else if (T == _typeOf<Map<String, dynamic>>()) {
      return getJson(key) as T?;
    } else if (T == DateTime) {
      return getDateTime(key) as T?;
    }
    throw ArgumentError(
        'The $T type is incompatible - Use only double, int, String, bool, List<String>, '
            'Map<String, dynamic>, ThemeMode, Color or DateTime');
  }

  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  ///
  /// If the value is null, return the [defaultValue]
  T getOrElse<T extends Object>(String key, {required T defaultValue}) {
    if (T == double) {
      return getDoubleOrElse(key, defaultValue: defaultValue as double) as T;
    } else if (T == int) {
      return getIntOrElse(key, defaultValue: defaultValue as int) as T;
    } else if (T == String) {
      return getStringOrElse(key, defaultValue: defaultValue as String) as T;
    } else if (_typeOf<List<String>>() == T) {
      return getStringListOrElse(key,
          defaultValue: defaultValue as List<String>) as T;
    } else if (T == bool) {
      return getBoolOrElse(key, defaultValue: defaultValue as bool) as T;
    } else if (T == _typeOf<Map<String, dynamic>>()) {
      return getJsonOrElse(key,
          defaultValue: defaultValue as Map<String, dynamic>) as T;
    } else if (T == DateTime) {
      return getDateTimeOrElse(key, defaultValue: defaultValue as DateTime)
      as T;
    }
    throw ArgumentError(
        'The $T type is incompatible - Use only double, int, String, bool, List<String>, '
            'Map<String, dynamic>, ThemeMode, Color or DateTime');
  }

  /// Writes a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  Future<bool> setValue<T extends Object>(String key, T value) {
    if (value is List<String>) {
      return setStringList(key, value);
    } else if (value is double) {
      return setDouble(key, value);
    } else if (value is int) {
      return setInt(key, value);
    } else if (value is String) {
      return setString(key, value);
    } else if (value is bool) {
      return setBool(key, value);
    } else if (value is Map<String, dynamic>) {
      return setJson(key, value);
    } else if (value is DateTime) {
      return setDateTime(key, value);
    }

    throw ArgumentError(
        'The $T type is incompatible - Use only double, int, String, bool, List<String>, '
            'Map<String, dynamic>, ThemeMode, Color or DateTime');
  }

  Future<bool> setJson(String key, Map<String, dynamic> map) =>
      setString(key, jsonEncode(map));

  /// Stores values as timezone independent milliseconds
  /// from the standard Unix epoch.
  Future<bool> setDateTime(String key, DateTime dateTime) =>
      setString(key, dateTime.millisecondsSinceEpoch.toString());

  Map<String, dynamic>? getJson(String key) {
    final value = getString(key);
    return value != null ? jsonDecode(value) as Map<String, dynamic> : null;
  }

  DateTime? getDateTime(String key) {
    final value = getString(key);
    return value != null
        ? DateTime.fromMillisecondsSinceEpoch(int.parse(value), isUtc: true)
        : null;
  }

  bool getBoolOrElse(String key, {required bool defaultValue}) =>
      getBool(key) ?? defaultValue;

  int getIntOrElse(String key, {required int defaultValue}) =>
      getInt(key) ?? defaultValue;

  double getDoubleOrElse(String key, {required double defaultValue}) =>
      getDouble(key) ?? defaultValue;

  String getStringOrElse(String key, {required String defaultValue}) =>
      getString(key) ?? defaultValue;

  List<String> getStringListOrElse(String key,
      {required List<String> defaultValue}) =>
      getStringList(key) ?? defaultValue;

  Map<String, dynamic> getJsonOrElse(String key,
      {required Map<String, dynamic> defaultValue}) =>
      getJson(key) ?? defaultValue;

  DateTime getDateTimeOrElse(String key, {required DateTime defaultValue}) =>
      getDateTime(key) ?? defaultValue;

}
