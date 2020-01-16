import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  ///
  /// 0: LIGHT
  /// 1: DARK
  /// 2: ORANGE
  ///

  static const String _PREF_THEME = "app_theme";

  static Future<void> saveTheme(int themeIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_PREF_THEME, themeIndex);
  }

  static Future<int> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_PREF_THEME) ?? 0;
  }
}
