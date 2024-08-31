
import 'package:flutter/material.dart';

import 'answer_box.dart';

Row answersRow(List<int> answer) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      answerBox('${answer[0]}'),
      answerBox('${answer[1]}'),
      answerBox('${answer[2]}'),
    ],
  );
}
