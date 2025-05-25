import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences _sharedPreferences;
  static final FlutterSecureStorage _secureStorage =
      const FlutterSecureStorage();
  static Future<void> initCache() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> set({required String key, required dynamic value}) async {
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      await _sharedPreferences.setStringList(key, value);
    } else {
      throw UnsupportedError('Unsupported value type: ${value.runtimeType}');
    }
  }

  static String? getString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  static int? getInt({required String key}) {
    return _sharedPreferences.getInt(key);
  }

  static bool? getBool({required String key}) {
    return _sharedPreferences.getBool(key);
  }

  static double? getDouble({required String key}) {
    return _sharedPreferences.getDouble(key);
  }

  static List<String>? getStringList({required String key}) {
    return _sharedPreferences.getStringList(key);
  }

  static Future<bool> remove({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  static Future<void> setSecure({
    required String key,
    required String value,
  }) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String?> getSecure({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  static Future<void> removeSecure({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> clearSecure() async {
    await _secureStorage.deleteAll();
  }
}
