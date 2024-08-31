import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/screen_five_controller.dart';
import '../cus_text.dart';

class ResultPart extends StatelessWidget {
  const ResultPart({
    super.key,
    required this.index, required this.width,
  });
  final int index;
  final double width;
  @override
  Widget build(BuildContext context) {
    var isCorrect = context.watch<ScreenFiveController>().isCorrect[index];
    Color color = isCorrect ? Colors.green : Colors.red;
    return Row(
      children: [
        customText(
          width: width,
          isCorrect ? 'Correct' : 'Wrong',
          fontColor: color,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isCorrect ? Icons.task_alt : Icons.close,
            color: color,
            size: width * .2,
          ),
        ),
      ],
    );
  }
}
