
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/state_mange/create_data.dart';
import '../provider/state_mange/update_ui.dart';
import '../widget/screen_seven_widget/play_ground.dart';
import '../widget/screen_seven_widget/top_part_sv.dart';

class ScreenSeven extends StatelessWidget {
  const ScreenSeven({super.key});

  @override
  Widget build(BuildContext context) {
    var createData = context.read<CreateData>();
    var updateUi = context.read<UpdateUi>();
    createData.assignTODetectNumberPuzzle();
    updateUi.assignTODetectNumberPuzzle();

    createData.start();
    updateUi.fillData(createData.readData());

    return const Column(
      children: [
        TopPartSV(),
        PlayGround(),
      ],
    );
  }
}
