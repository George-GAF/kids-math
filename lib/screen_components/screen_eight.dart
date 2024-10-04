import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/app_size.dart';
import '../helper/puzzles_class/shape_value_puzzle.dart';
import '../provider/board_provider.dart';
import '../provider/massage_provider.dart';
import '../provider/state_mange/create_data.dart';
import '../provider/state_mange/update_ui.dart';
import '../widget/board.dart';
import '../widget/screen_eight_widget/shapes_widget_row.dart';
import '../widget/screen_eight_widget/values_widget_row.dart';

class ScreenEight extends StatelessWidget {
  const ScreenEight({super.key});

  @override
  Widget build(BuildContext context) {

    context.watch<MassageProvider>().isAnimDone;

    late CreateData puzzle;
    late UpdateUi puzzleU;
    late ShapeValuePuzzle shapeValue;

    var size = AppSize().getHeight() * .1;

      puzzle = context.read<CreateData>();
      puzzle.assignToPuzzle(ShapeValuePuzzle());
      puzzle.start();
      shapeValue = puzzle.puzzle as ShapeValuePuzzle;

      puzzleU = context.watch<UpdateUi>();
      puzzleU.assignToPuzzle(ShapeValuePuzzle());
      puzzleU.fillData(shapeValue);

    var length = shapeValue.getLen() ;
    // log('after newList : $newList');
    //log('after shapeValueList : ${shapeValue.shapeValueList}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _guideWidget(size, length),
            _questionWidget(size, length),
          ],
        ),
        Board(
          getValue: (value) {
            context
                .read<BoardProvider>()
                .updateNumberTyped(value, allowedLen: 1);
          },
        ),
      ],
    );
  }

  Column _questionWidget(double size, int length) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShapesWidgetRow(
          size: size,
          isShuffle: true,
        ),
        ValuesWidgetRow(
          isInput: true,
          length: length,
          size: size,
          borderColor: Colors.lightGreenAccent,
          color: Colors.white,
        ),
      ],
    );
  }

  Column _guideWidget(double size, int length) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShapesWidgetRow(size: size),
        ValuesWidgetRow(
          length: length,
          size: size,
          borderColor: Colors.lightGreenAccent,
          color: Colors.white,
        ),
      ],
    );
  }
}