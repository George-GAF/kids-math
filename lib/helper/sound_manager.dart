import 'package:audioplayers/audioplayers.dart';

import 'setting.dart';

class SoundManager {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playSound(String soundPath) async {
    if(!isSoundOn){
      return;
    }
    await _player.stop(); // Ensure previous sound is stopped
    await _player.play(AssetSource(soundPath)); // Play the sound from the asset
  }

  static void pauseSound() {
    _player.pause();
  }

  static void resumeSound() {
    _player.resume();
  }

  static void stopSound() {
    _player.stop();
  }
}