
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/screen_one_controller.dart';
import '../cus_text.dart';
import 'answer_details.dart';

class HistoryPart extends StatelessWidget {
  const HistoryPart({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * .4;
    var history = context.watch<ScreenOneController>().answerHistory;
    return Column(
      children: [
        customText('Answer History', width: width),
        history.isEmpty
            ? const SizedBox()
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
              'Right Answer : ${history.where((element) => element.isRight).length}',
              width: width * .9,
            ),
            customText(
              'Wrong Answer : ${history.where((element) => !element.isRight).length}',
              width: width * .9,
            )
          ],
        ),
        history.isEmpty
            ? const SizedBox()
            : Expanded(
          child: ListView.builder(
            reverse: true,
            controller: controller,
            itemCount: history.length,
            itemBuilder: (context, i) =>
                AnswerDetails(answer: history[i]),
          ),
        ),
      ],
    );
  }
}
