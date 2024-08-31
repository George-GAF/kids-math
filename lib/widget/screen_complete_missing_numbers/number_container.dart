import 'package:flutter/material.dart';

import '../cus_text.dart';
import 'input_text_field.dart';

class NumberContainer extends StatelessWidget {
  const NumberContainer({
    super.key,
    required this.size,
    required this.isMissing,
    required this.number,
    required this.updateAnswerState,
    required this.answerIndex,
    required this.onTap,
    required this.index,
    required this.isAscending,
  });
  final bool isAscending;
  final int index;
  final double size;
  final bool isMissing;
  final int number;
  final int answerIndex;
  final Function(int, bool) updateAnswerState;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: isAscending ? _isAscendingDec(size) : _isNotAscendingDec(),
      child: isMissing
          ? InputTextField(
              number: number,
              size: size,
              answerIndex: answerIndex,
              updateAnswerState: updateAnswerState,
              onTap: onTap,
              index: index,
            )
          : customText(number == 0 ? '' : number.toString()),
    );
  }
}

BoxDecoration _isAscendingDec(double size) {
  return BoxDecoration(
    border: Border.all(color: Colors.black),
    color: Colors.white,
    borderRadius: BorderRadius.circular(size * .1),
  );
}

BoxDecoration _isNotAscendingDec() {
  return BoxDecoration(
    border: Border.all(color: Colors.black),
    color: Colors.white,
    shape: BoxShape.circle,
  );
}
