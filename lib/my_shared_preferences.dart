import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static const String _userEmailKey = 'user_email';
  static const String _firstTimeKey = 'first_time';
  static const String _hasVisitedHomePageKey = 'has_visited_home_page';

  static Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey) ??
        ''; // Provide an empty string as a default value
  }

  static Future<bool> setUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userEmailKey, userEmail);
  }

  static Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeKey) ?? true;
  }

  static Future<bool> setFirstTime(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_firstTimeKey, value);
  }

  static Future<bool> getHasVisitedHomePage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasVisitedHomePageKey) ?? false;
  }

  static Future<bool> setHasVisitedHomePage(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_hasVisitedHomePageKey, value);
  }
}
