import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences sharedPref;
  static Future cachInit() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> setToData({
    required String key,
    required String value,
  }) async {
    return await sharedPref.setString(key, value);
  }

  static String getFromData({
    required String key,
  }) {
    return sharedPref.getString(key) ?? '';
  }
}
