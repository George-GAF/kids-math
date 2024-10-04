import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/constant.dart';
import '../../helper/sound_manager.dart';
import '../../widget/cus_text.dart';
import '../../helper/app_size.dart';
import '../../provider/screen_five_controller.dart';

class AnswerPart extends StatelessWidget {
  const AnswerPart({
    super.key,
    required this.width,
    required this.index,
  });
  final double width;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          sideAnswer(index, 0),
          customText(
            '+',
            width: width * .1,
          ),
          sideAnswer(index, 1),
        ],
      ),
    );
  }

  Row sideAnswer(int index, int sideIndex) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ColoredContainer(index, sideIndex),
            _ColoredContainer(index, sideIndex),
          ],
        ),
        _ColoredContainer(index, sideIndex),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ColoredContainer(index, sideIndex),
            _ColoredContainer(index, sideIndex),
          ],
        ),
      ],
    );
  }
}

class _ColoredContainer extends StatefulWidget {
  const _ColoredContainer(
    this.index,
    this.sideIndex,
  );
  final int index;
  final int sideIndex;
  @override
  State<_ColoredContainer> createState() => _ColoredContainerState();
}

class _ColoredContainerState extends State<_ColoredContainer> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    var provider = context.read<ScreenFiveController>();
    var width = (AppSize().getWidth() * .8) * .4;
    if (context.watch<ScreenFiveController>().isAllCorrect) {
      setState(() {
        isTapped = false;
      });
    }
    return GestureDetector(
      onTap: () {
        SoundManager.sound.playSound(click);
        bool isCorrect = provider.isCorrect[widget.index];
        if (isCorrect) {
          return;
        }
        setState(() {
          isTapped = !isTapped;
        });
        var userAnswer = provider.userAnswer;
        var rowAn = userAnswer[widget.index];
        var sideAns = rowAn[widget.sideIndex];
/*
        log('-----------------------------------------------------------------------');
        log('index : ${widget.index} | Side Index : ${widget.sideIndex} ');
        log('user Answer List : $userAnswer');
        log('user Answer Row : $rowAn');
        log('user Side Answer Before : $sideAns');*/
        var newValue = isTapped ? sideAns + 1 : sideAns - 1;
        rowAn[widget.sideIndex] = newValue;
        /*log('user Side Answer after : $sideAns');
        log('-----------------------------------------------------------------------');
        log('**************************************');
        log('user Answer Row : $rowAn');
        log('**************************************');*/
        provider.updateUserAnswer(widget.index, rowAn);
        provider.isCorrectUpdate(widget.index);
        provider.testIsAllCorrect();

      },
      child: Container(
        height: width * .1,
        width: width * .1,
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
            color: isTapped ? Colors.blue : Colors.transparent),
      ),
    );
  }
}
