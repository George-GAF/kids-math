import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../provider/massage_provider.dart';
import '../provider/state_mange/create_data.dart';
import '../provider/state_mange/update_ui.dart';
import '../widget/message_image.dart';
import '../widget/screen_six_widget/shapes_area.dart';
import '../widget/screen_six_widget/solution.dart';
import '../widget/screen_six_widget/target.dart';

class ScreenSix extends StatelessWidget {
  const ScreenSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Consumer<UpdateUi>(builder: (context, updateUi, child) {
            var isDone = context.read<MassageProvider>().isAnimDone;
            var createData = context.read<CreateData>();
            createData.assignToColorAndShapePuzzle();
            updateUi.assignToColorAndShapePuzzle();
            var blank = createData.shapePuzzle().blank();
            //var isDone = massage.isAnimDone;
            createData.start();
            updateUi.fillData(createData.readData());

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Target(
                  shapes: isDone ? updateUi.shapePuzzle().targetShapes : blank,
                ),
                ShapesArea(
                    shapes: isDone ? updateUi.shapePuzzle().shapes : blank),
                Solution(
                  shapes: isDone ? updateUi.shapePuzzle().shapes : blank,
                ),
              ],
            );
          }),
          context.watch<MassageProvider>().isAnimDone
              ? const SizedBox()
              : const MessageImage(
                  imagePath: '${wordPath}EXCELLENT.png',
                ),
        ],
      ),
    );
  }
}
