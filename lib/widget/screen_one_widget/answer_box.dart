

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../constant/enum_file.dart';
import '../../helper/answer_detail.dart';
import '../../provider/massage_provider.dart';
import '../../provider/screen_one_controller.dart';
import '../cus_text.dart';

LayoutBuilder answerBox(String data) {
  return LayoutBuilder(builder: (context, box) {
    var providerW = context.watch<ScreenOneController>();
    var providerR = context.read<ScreenOneController>();
    var massageProR = context.read<MassageProvider>();
    var question = providerW.question;
    var operationType = providerW.activeOperation;

    double height = MediaQuery.of(context).size.height * answerPartPer;
    double width = MediaQuery.of(context).size.width;
    double smallest = height > width ? width : height;
    double bSize = (smallest / 3) - (smallest * .1);

    return GestureDetector(
      onTap: () {
        bool isCorrect = false;
        AnswerDetail answerDetail = AnswerDetail();
        int value = int.parse(data);
        if (operationType.value == '+') {
          isCorrect = value == question[0] + question[1];
        } else {
          isCorrect = value == question[0] - question[1];
        }
        massageProR.updateIsRight(isCorrect);

        answerDetail.answer = value;
        answerDetail.isRight = isCorrect;
        answerDetail.firstNum = question[0];
        answerDetail.secondNum = question[1];
        answerDetail.operation = operationType.value;

        massageProR.switchAnimState();

        Future.delayed(const Duration(milliseconds: timeToShowMessageInMill), () {
          context.read<ScreenOneController>().addAnswerToHistory(answerDetail);
          
          providerW.questionWithAnswer.newQuestion();
          providerR.updateQuestion(providerW.questionWithAnswer.questionContent);
          providerR.updateAnswers(providerW.questionWithAnswer.answersList);

          massageProR.switchAnimState();

          controller.animateTo(
            controller.position.maxScrollExtent,
            curve: Curves.slowMiddle,
            duration: const Duration(milliseconds: 250),
          );
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(smallest * .05),
        width: bSize,
        height: bSize,
        decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              color: Colors.black38,
            ),
          ],
          borderRadius: BorderRadius.circular(bSize * .2),
          border: Border.all(
            color: Colors.orange,
            width: bSize * .08,
            style: BorderStyle.solid,
          ),
        ),
        child: customText(data),
      ),
    );
  });
}
