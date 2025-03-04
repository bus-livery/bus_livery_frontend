import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class SharedPrefService {
  static SharedPreferences? _preferences;

  static const int _cacheExpirationSeconds =
      1800; // Expiration time in seconds (1 hour)

  Future<void> cacheApiData(
      {required String key, required String value}) async {
    String timeKey = 'time_$key';
    await _preferences?.setString(key, value);
    await _preferences?.setInt(timeKey, DateTime.now().millisecondsSinceEpoch);
  }

  String? getCachedApiData({required String key}) {
    String timeKey = 'time_$key';

    final dynamic cachedTime = _preferences?.getInt(timeKey);

    final int currentTime = DateTime.now().millisecondsSinceEpoch;

    if (cachedTime != null &&
        currentTime - cachedTime < _cacheExpirationSeconds * 1000) {
      // Cache is still valid, return the cached data
      return _preferences?.getString(key);
    } else {
      // Cache has expired or does not exist
      return null;
    }
  }

  // Initialization method to load shared preferences instance
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Method to save a string value
  Future<void> saveString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  // Method to get a string value
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  // Method to remove a value
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  // Method to clear a value
  Future<void> clear() async {
    await _preferences?.clear();
  }
}
