import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _preferences;

  StorageService({required SharedPreferences preferences})
      : _preferences = preferences;

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  Future<String> getString(String key) async {
    return _preferences.getString(key) ?? '';
  }

  bool getBool(String key)  {
    return _preferences.getBool(key) ?? false;
  }
}
