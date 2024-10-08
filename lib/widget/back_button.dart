import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../helper/sound_manager.dart';
import '../provider/active_screen.dart';
import '../provider/board_provider.dart';
import '../provider/massage_provider.dart';
import '../provider/screen_one_controller.dart';
import '../provider/screen_two_controller.dart';
import '../provider/screen_five_controller.dart';

class ScreenBackButton extends StatelessWidget {
  const ScreenBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      return IconButton(
        onPressed: () {
          SoundManager.sound.playSound(menuClick);
          context.read<ActiveScreen>().updateIndex(0);
          context.read<ActiveScreen>().updateBackGroundIndex(0);
          context.read<MassageProvider>().resetValue();
          context.read<BoardProvider>().resetValue();
          context.read<ScreenOneController>().resetValue();
          context.read<ScreenTwoController>().resetValue();
          context.read<ScreenFiveController>().resetValue();

        },
        icon: const Icon(
          Icons.arrow_circle_left_rounded,
          shadows: [
            Shadow(
              color: Colors.black54,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        color: Colors.amber,
        iconSize: box.maxHeight,
      );
    });
  }
}
