import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';

import '../constant/constant.dart';
import 'setting.dart';

class SoundManager {

  static final AudioPlayer _music = AudioPlayer();
  static final AudioPlayer _sound = AudioPlayer();
  static final AudioPlayer _assetSound = AudioPlayer();
  static final SoundController music = SoundController(_music);
  static final SoundController sound = SoundController(_sound);
  static final SoundController assetSound = SoundController(_assetSound);

  static void playExcellentSound(){
    sound.playSound(excellent);
    assetSound.playSound(celebrateWithExcellent);
  }

  static void playWrongSound(){
    //sound.playSound(wrongAnswer);
    assetSound.playSound(wrongMusic);
  }

 static void stopSound(){
    sound.stopSound();
    assetSound.stopSound();
  }

}

class SoundController {
  SoundController(this._player) ;
  final AudioPlayer _player;

   Future<void> playMusic(String music) async {
     log('Asset path : ${AssetSource(music)}');
    if (!isMusicOn) {
      return;
    }
    await _player.stop(); // Ensure previous sound is stopped
    await _player.play(AssetSource(music)); // Play the sound from the asset
  }

   Future<void> playSound(String soundPath) async {
     log('Asset path : ${AssetSource(soundPath)}');
    if (!isSoundOn) {
      return;
    }
    await _player.stop(); // Ensure previous sound is stopped
    await _player.play(AssetSource(soundPath)); // Play the sound from the asset

  }

   void pauseSound() {
    _player.pause();
  }

   void resumeSound() {
    _player.resume();
  }

   void stopSound() {
    _player.stop();
  }

}
