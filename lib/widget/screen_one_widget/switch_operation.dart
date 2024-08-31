

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/enum_file.dart';
import '../../provider/screen_one_controller.dart';
import '../cus_text.dart';

Widget switchOperation(BuildContext context, OperationType operationType) {
  var watch = context.watch<ScreenOneController>();
  var read = context.read<ScreenOneController>();
  return GestureDetector(
    onTap: () {
      if (watch.activeOperation != operationType) {
        read.updateActiveOperation(operationType);
        watch.questionWithAnswer.updateAnswers(operationType);
        read.updateAnswers(watch.questionWithAnswer.answersList);
      }
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1.5,
            blurRadius: 1,
          ),
        ],
        color: watch.activeOperation == operationType ? Colors.red : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black38,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: customText(operationType.value),
    ),
  );
}
