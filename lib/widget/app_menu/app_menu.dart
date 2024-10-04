import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

import '../../constant/constant.dart';
import '../../constant/enum_file.dart';
import '../../helper/app_size.dart';
import '../../helper/setting.dart';
import '../../helper/sound_manager.dart';
import '../menu_button.dart';

class AppMenuSetting extends StatelessWidget {
  const AppMenuSetting({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppSize().getHeight() * .6;
    var width = AppSize().getWidth() * .5;
    var buttonWidth = width * .8;

    return AlertDialog(
      shadowColor: Colors.green,
      backgroundColor: Colors.green[100],
      titlePadding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      elevation: 3,
      scrollable: true,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.yellow,width: 5, ),
          borderRadius: BorderRadius.circular(height * .1),),
      alignment: Alignment.center,
      title: TextButtonMenu(
        'Setting',
        width: buttonWidth,
        fontColor: const Color.fromARGB(255, 255, 0, 0),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //mainAxisSize: MainAxisSize.min,
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              return SettingController(
                buttonWidth: buttonWidth,
                onPressed: () {
                  setState(() {
                    isSoundOn = !isSoundOn;
                  });
                  if(!isSoundOn){
                    SoundManager.stopSound();
                  }
                  SavedSetting.saveSetting(isSoundOn, Setting.sound);
                },
                setting: Setting.sound,
                isOn: isSoundOn,
                offIcon: Icons.volume_mute_rounded,
                onIcon: Icons.volume_down_rounded,
              );
            },
          ),
          StatefulBuilder(
            builder: (context, setState) {
              return SettingController(
                buttonWidth: buttonWidth,
                onPressed: () {
                  setState(() {
                    isMusicOn = !isMusicOn;
                  });
                  if(!isMusicOn){
                    SoundManager.music.stopSound();
                  }else{
                    SoundManager.music.playSound(music);
                  }

                  SavedSetting.saveSetting(isMusicOn, Setting.music);
                },
                setting: Setting.music,
                isOn: isMusicOn,
                offIcon: Icons.music_off_rounded,
                onIcon: Icons.music_note_rounded,
              );
            },
          ),
          MenuButton(
            width: buttonWidth,
            colors: [Colors.green[300]!, Colors.green[700]!],
            onPressed: () {
              Wakelock.disable();
              SystemNavigator.pop();
            },
            child: TextButtonMenu(
              'Exit',
              width: buttonWidth,
            ),
          ),
          MenuButton(
            width: width * .6,
            colors: [Colors.green[400]!, Colors.green[900]!],
            child: TextButtonMenu(
              'Close',
              width: width * .6,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class SettingController extends StatelessWidget {
  const SettingController({
    super.key,
    required this.buttonWidth,
    required this.setting,
    required this.onPressed,
    required this.isOn,
    required this.onIcon,
    required this.offIcon,
  });
  final VoidCallback onPressed;
  final Setting setting;
  final double buttonWidth;
  final bool isOn;
  final IconData onIcon;
  final IconData offIcon;
  @override
  Widget build(BuildContext context) {
    return MenuButton(
        width: buttonWidth,
        colors: [Colors.green[300]!, Colors.green[700]!],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButtonMenu(
              '${setting.value}${isOn ? " ON " : " OFF "}',
              fontColor:Colors.white, //Colors.blue[900]!,
              width: buttonWidth,
            ),
            Icon(
              isOn ? onIcon : offIcon,
              color: Colors.white,//Colors.blue[900],
              size: buttonWidth * 0.09,
            ),
          ],
        ),
        onPressed: () {
          onPressed();
        });
  }
}
