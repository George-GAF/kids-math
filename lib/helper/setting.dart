import 'package:shared_preferences/shared_preferences.dart';

import '../constant/enum_file.dart';

bool isSoundOn = true;
bool isMusicOn = true;

class SavedSetting {
  static Future<void> saveSetting(bool value, Setting setting) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(setting.value, value);
  }

  static Future<bool> loadSetting(Setting setting) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(setting.value) ??
        true; // Use a default value if not found
  }
}
