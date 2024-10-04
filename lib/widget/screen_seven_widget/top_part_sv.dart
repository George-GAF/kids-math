
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/sound_manager.dart';
import '../../provider/state_mange/create_data.dart';
import '../../provider/state_mange/update_ui.dart';
import '../cus_text.dart';

class TopPartSV extends StatelessWidget {
  const TopPartSV({super.key});

  @override
  Widget build(BuildContext context) {
    var updateUi = context.watch
    <UpdateUi>();
    var score = updateUi.numberPuzzle().score;
    var maxScore = Random().nextInt(score + 30) + (score * .5).toInt();
    if (score >= maxScore) {
      var createData = context.read<CreateData>();
      createData.start();
      updateUi.fillData(createData.readData());
      var soundPath = updateUi.numberPuzzle().target().toLowerCase();
      SoundManager.sound.playSound('sound/$soundPath.mp3');
    }

    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          customText('Score : $score'),
          Row(
            children: [
              customText('Your Target :  '),
              customText(updateUi.numberPuzzle().target(),
                  fontColor: Colors.red)
            ],
          ),
        ],
      ),
    );
  }
}
