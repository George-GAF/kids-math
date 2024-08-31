import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/screen_five_controller.dart';
import '../cus_text.dart';

class QuestionPart extends StatelessWidget {
  const QuestionPart({
    super.key,
    required this.index, required this.width,
  });
  final int index;
  final double width;
  @override
  Widget build(BuildContext context) {
    var question = context.watch<ScreenFiveController>().question[index];
    return SizedBox(
      width: width,
      child: customText('${question[0]} + ${question[1]}'),
    );
  }
}
