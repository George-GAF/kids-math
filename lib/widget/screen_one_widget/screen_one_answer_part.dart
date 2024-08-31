
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/screen_one_controller.dart';
import 'answer_row.dart';

class AnswerPart extends StatelessWidget {
  const AnswerPart({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ScreenOneController>();

    var answers = provider.answers;
    return Column(
      children: [
        answersRow(answers.sublist(0, 3)),
        answersRow(answers.sublist(3, 6)),
      ],
    );
  }
}
