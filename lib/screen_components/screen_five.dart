
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/screen_five_controller.dart';
import '../constant/constant.dart';
import '../helper/app_size.dart';
import '../provider/massage_provider.dart';
import '../widget/message_image.dart';
import '../widget/screen_five_widget/question_row.dart';

class ScreenFive extends StatelessWidget {
  const ScreenFive({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppSize().getWidth() * .8;
    var height = AppSize().getHeight();
    var provider = context.watch<ScreenFiveController>();
    provider.createQuestionList();
    var massageProvider = context.watch<MassageProvider>();

    if (provider.isAllCorrect && massageProvider.isAnimDone) {
      Future.microtask(() {
        massageProvider.switchAnimState();
        Future.delayed(const Duration(milliseconds: timeToShowMessageInMill),
            () {
          provider.resetValue();
          provider.createQuestionList();
          massageProvider.switchAnimState();
        });
      });
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(
            paddingSF,
          ),
          margin: const EdgeInsets.only(
            bottom: marginSF,
          ),
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height * .05),
            border: Border.all(
              color: Colors.deepOrange,
              width: widthBSF * 2,
            ),
          ),
          child: Column(
            children: List.generate(
              provider.listLength(),
              (index) => QuestionRow(
                index: index,
              ),
            ),
          ),
        ),
        massageProvider.isAnimDone
            ? const SizedBox()
            : const MessageImage(
                imagePath: '${wordPath}EXCELLENT.png',
              ),
      ],
    );
  }
}
