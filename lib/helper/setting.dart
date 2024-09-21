
import 'package:shared_preferences/shared_preferences.dart';

bool isSoundOn = true;

class SavedSetting {
  Future<void> saveSetting(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('play_sound', value);
  }

  Future<bool> loadSetting() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('play_sound') ??
        true; // Use a default value if not found
  }
}
