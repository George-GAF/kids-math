import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/constant.dart';
import '../provider/massage_provider.dart';
import '../provider/screen_one_controller.dart';
import '../widget/message_image.dart';
import '../widget/screen_one_widget/screen_one_answer_part.dart';
import '../widget/screen_one_widget/history_part.dart';
import '../widget/screen_one_widget/operation_type_part.dart';
import '../widget/screen_one_widget/screen_one_question_part.dart';


class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<ScreenOneController>();
    var questionWithAnswer = provider.questionWithAnswer;

    var massageProW = context.watch<MassageProvider>();
    var imagePath = massageProW.getImagePath();

    questionWithAnswer.fillValue(provider.activeOperation, 5, 30);
    provider.saveData(
        questionWithAnswer.questionContent, questionWithAnswer.answersList);

    double avaHeight = MediaQuery.of(context).size.height - blockArea;
    double avaWidth = MediaQuery.of(context).size.width;
   return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: avaWidth * .4,
              child: const HistoryPart(),
            ),
            Column(
              children: [
                SizedBox(
                  height: avaHeight * operationPartPer,
                  child: const OperationTypePart(),
                ),
                SizedBox(
                  height: avaHeight * questionPartPer,
                  child: const QuestionPart(),
                ),
                SizedBox(
                  height: avaHeight * answerPartPer,
                  child: const AnswerPart(),
                ),
              ],
            ),
          ],
        ),
        massageProW.isAnimDone
            ? const SizedBox()
            : MessageImage(imagePath: imagePath),
      ],
    );
  }
}
