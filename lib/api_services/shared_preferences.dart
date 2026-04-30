import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static SharedPreferences? prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // static const _firstName = 'firstName';
  static const _stargazerId = 'stargazerId';
  static const _stargazerCreatedAt = 'stargazerCreatedAt';

  // static Future setFirstName(String v) async => prefs!.setString(_firstName, v);
  // static String? getFirstName() => prefs!.getString(_firstName);

  static Future setStargazerId(String id) async =>
      prefs!.setString(_stargazerId, id);
  static String? getStargazerId() => prefs!.getString(_stargazerId);

  static Future setStargazerCreatedAt(String createdAt) async =>
      prefs!.setString(_stargazerCreatedAt, createdAt);
  static String? getStargazerCreatedAt() =>
      prefs!.getString(_stargazerCreatedAt);

  static Future clear() async {
    await prefs!.clear();
  }
}
