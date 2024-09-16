import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  AppSharedPref._();

  static const userLoggedIn = 'userLoggedIn';

  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setUserLoggedIn(bool value) async =>
      await prefs.setBool(userLoggedIn, value);

  static bool get isUserLoggedIn => prefs.getBool(userLoggedIn) ?? false;

  static Future<void> clear() async => await prefs.clear();
}
