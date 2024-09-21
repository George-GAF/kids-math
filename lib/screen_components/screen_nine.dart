import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/puzzles_class/color_number.dart';
import '../provider/massage_provider.dart';
import '../provider/state_mange/create_data.dart';
import '../provider/state_mange/update_ui.dart';
import '../widget/cus_text.dart';
import '../widget/screen_nine_widget/colors_plate.dart';
import '../widget/screen_nine_widget/number_row_sn.dart';
import '../widget/screen_nine_widget/play_area_sn.dart';

class ScreenNine extends StatelessWidget {
  const ScreenNine({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenContent();
  }
}

class ScreenContent extends StatelessWidget {
  const ScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<MassageProvider>().isAnimDone;
    var createData = context.read<CreateData>();
    createData.assignToPuzzle(ColorNumber());
    createData.start();
    ColorNumber colorNumber = createData.puzzle as ColorNumber;
    var colorsCount = colorNumber.colorCount;
    var colorsList = colorNumber.colorList;

    var update = context.read<UpdateUi>();
    update.assignToPuzzle(ColorNumber());
    update.fillData(colorNumber);
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            customText(
              'Match the colors of the numbers below to those above.',
              height:25,
              fontColor: Colors.deepOrange,
            ),
            SizedBox(
              height: 50,
              child: NumberRow(colorNumber: colorNumber),
            ),
          ],
        ),
        Row(
          children: [
            PlayArea(colorsCount: colorsCount),
            ColorsPlate(colorsList: colorsList),
          ],
        ),
      ],
    );
  }
}
