import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../helper/puzzles_class/shape_value_puzzle.dart';
import '../../provider/board_provider.dart';
import '../../provider/massage_provider.dart';
import '../../provider/state_mange/update_ui.dart';
import '../screen_complete_missing_numbers/input_text_field.dart';

class ValuesWidgetRow extends StatelessWidget {
  const ValuesWidgetRow({
    super.key,
    required this.length,
    required this.size,
    required this.borderColor,
    required this.color,
    this.isInput = false,
  });

  final int length;
  final double size;
  final Color borderColor;
  final Color color;
  final bool isInput;

  final _perSize = 0.03;
  @override
  Widget build(BuildContext context) {
    var borderW = size * _perSize;
    late ShapeValuePuzzle shapeValue;

    if (isInput) {
      shapeValue = context.read<UpdateUi>().puzzle as ShapeValuePuzzle;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Container(
          width: size * 2,
          height: size * 2,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: borderW, color: borderColor),
              horizontal: BorderSide(width: borderW * 2, color: borderColor),
            ),
          ),
          child: isInput
              ? InputTextField(
                  number: shapeValue.getValuesList()[index],
                  size: size * 2,
                  answerIndex: index,
                  updateAnswerState: (index, state) {
                    shapeValue.updateState(index, state);
                    bool isDone = shapeValue.testIsAllRight();
                    if (isDone) {
                      Future.microtask(() {
                        context.read<MassageProvider>().switchAnimState();
                        Future.delayed(
                            const Duration(
                                milliseconds: timeToShowMessageInMill), () {
                          context.read<BoardProvider>().resetValue();
                          context.read<BoardProvider>().turnClearTrue();
                          context.read<MassageProvider>().switchAnimState();
                        });
                      });
                    }
                  },
                  onTap: () {
                    context.read<BoardProvider>().updateIndex(index);
                  },
                  index: index,
                )
              : Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: size * .75,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
