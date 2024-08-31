import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/constant.dart';
import '../../helper/app_size.dart';
import '../../provider/screen_five_controller.dart';
import 'result_part.dart';
import 'answer_part.dart';
import 'question_part.dart';

class QuestionRow extends StatelessWidget {
  const QuestionRow({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    var len = context.read<ScreenFiveController>().listLength();
    var areaRes = paddingSF * 2 + widthBSF * 2 * 2;
    var height =
        (AppSize().getHeight() - (marginSF + (marginSF * 2 * len) + areaRes)) /
            len;
    var width = (AppSize().getWidth() * .8) - areaRes;

    return Container(
      height: height,
      margin: const EdgeInsets.all(marginSF),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * .1),
        border: Border.all(
          color: Colors.black,
          width: widthBSF,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QuestionPart(
            index: index,
            width: width * .3,
          ),
          _divider(height),
          AnswerPart(
            index: index,
            width: width * .4,
          ),
          _divider(height),
          ResultPart(
            index: index,
            width: width * .3,
          ),
        ],
      ),
    );
  }

  Container _divider(double height) {
    return Container(
      width: widthBSF,
      height: height,
      color: Colors.black,
    );
  }
}
