import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  Future<void> saveIntValue({String? key, int? value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key ?? '', value ?? 0);
  }

  Future<int?> getIntValue({String? key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key ?? '');
  }

  Future<void> saveBooleanValue(
      {required String key, required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key ?? '', value ?? false);
  }

  Future<bool> getBooleanValue({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool boolValue = prefs.getBool(key) ?? false;
    return boolValue;
  }

  Future<void> saveStringValue({String? key, String? value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key ?? '', value ?? '');
  }

  Future<String> getStringValue({String? key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String stringValue = prefs.getString(key ?? '') ?? '';
    return stringValue;
  }

  Future<void> deleteValue({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
