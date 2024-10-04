import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../helper/sound_manager.dart';
import '../provider/active_screen.dart';
import 'app_menu/app_menu.dart';
import 'back_button.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedScreen = context.watch<ActiveScreen>().selectedIndex;
    return SizedBox(
      height: blockArea,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          selectedScreen == 0
              ? const SizedBox(
                  width: blockArea,
                )
              : const ScreenBackButton(),
          Container(
            width: MediaQuery.of(context).size.width - 160,
          ),
          IconButton(
            onPressed: () {
              SoundManager.sound.playSound(menuClick);
              showDialog(
                  context: context,
                  builder: (context) => const AppMenuSetting());
            },
            icon: const Icon(
              shadows: [
                Shadow(
                  color: Colors.black54,
                  offset: Offset(2, 2),
                  blurRadius: 10,
                ),
              ],
              color: Color(0XFF9AD80B),
              Icons.settings,
              fill: 1,
              size: 45,
            ),
          ),
        ],
      ),
    );
  }
}
