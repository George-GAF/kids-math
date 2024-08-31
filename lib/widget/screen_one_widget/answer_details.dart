import 'package:flutter/material.dart';

import '../../helper/answer_detail.dart';
import '../cus_text.dart';

class AnswerDetails extends StatelessWidget {
  const AnswerDetails({required this.answer, super.key});
  final AnswerDetail answer;
  @override
  Widget build(BuildContext context) {
    const v = 5;
    var width = MediaQuery.of(context).size.width * .40;
    answer.space();
    return Row(
     // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        customText(
          '${answer.firstNum}${answer.spaces.first}',
          width: width / v,
        ),
        customText(answer.operation, width: width / 10),
        customText(
          '${answer.spaces[1]}${answer.secondNum}',
          width: width / v,
        ),
        customText(
          ' = ',
          width: width / v,
        ),
        customText(
          '${answer.spaces.last}${answer.answer}',
          width: width / v,
        ),
        answer.isRight
            ? const Icon(
                Icons.check,
                color: Colors.green,
              )
            : const Icon(
                Icons.close_rounded,
                color: Colors.red,
              ),
        answer.isRight
            ? const SizedBox()
            : customText(
                'Correct Answer : ${answer.operation == "+" ? answer.firstNum + answer.secondNum : answer.firstNum - answer.secondNum} ',
                width: width,
              ),
      ],
    );
  }
}
/*
Widget answerDetails(AnswerDetail answer) {
  answer.space();
  return Row(
    children: [
      Text('${answer.firstNum}${answer.spaces.first}'),
      Text(answer.operation),
      Text('${answer.spaces[1]}${answer.secondNum}'),
      const Text(' = '),
      Text('${answer.spaces.last}${answer.answer}'),
      answer.isRight
          ? const Icon(
              Icons.check,
              color: Colors.green,
            )
          : const Icon(
              Icons.close_rounded,
              color: Colors.red,
            ),
      answer.isRight
          ? const SizedBox()
          : Text(
              'Correct Answer : ${answer.operation == "+" ? answer.firstNum + answer.secondNum : answer.firstNum - answer.secondNum} '),
    ],
  );
}
*/
