
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/constant.dart';
import '../../helper/puzzles_class/color_number.dart';
import '../../provider/massage_provider.dart';
import '../../provider/state_mange/update_ui.dart';
import '../cus_text.dart';
import 'screen_container.dart';

class PlayArea extends StatelessWidget {
  const PlayArea({super.key, required this.colorsCount});
  final int colorsCount;

  @override
  Widget build(BuildContext context) {
    var colorsNumberU = context.read<UpdateUi>().puzzle as ColorNumber;
    var ballCount = colorsNumberU.ballCount();
    return ContainerForBottomPart(
      widthPercent: 0.8,
      child: Container(
        color: Colors.white,
        child: Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          alignment: WrapAlignment.center,
          runSpacing: 10,
          spacing: 10,
          direction: Axis.vertical,
          children: List.generate(
            ballCount,
            (index) {
              var number = Random().nextInt(colorsCount) + 1;
              return NumberContainer(
                size: 40,
                number: number,
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}

class NumberContainer extends StatefulWidget {
  const NumberContainer({
    super.key,
    required this.size,
    required this.number,
    required this.index,
  });

  final double size;
  final int number;
  final int index;

  @override
  State<NumberContainer> createState() => _NumberContainerState();
}

class _NumberContainerState extends State<NumberContainer> {
  bool isClicked = false;
  bool isCorrect = true;
  late final double offset;
  @override
  void initState() {
    offset = widget.size * .04;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var massageProvider = context.watch<MassageProvider>();
    var data = context.read<UpdateUi>().puzzle as ColorNumber;
    var pickedColor = data.selected;
    var colorList = data.colorList;
    return GestureDetector(
      onTap: () {
        pickedColor = data.selected;
        var index = widget.number - 1;
        var correctColor = colorList[index];

        setState(() {
          isClicked = !isClicked;
          if (isClicked) {
            isCorrect = correctColor == pickedColor;
          } else {
            isCorrect = true;
          }

          data.updateResultState(widget.index, correctColor == pickedColor);
          if (data.isDone) {
            massageProvider.switchAnimState();
            Future.delayed(
                const Duration(milliseconds: timeToShowMessageInMill), () {
              massageProvider.switchAnimState();
            });
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: isClicked ? pickedColor : Colors.white,
          border: isCorrect
              ? Border.all()
              : Border.all(color: Colors.red, width: 3),
          boxShadow: [
            BoxShadow(
              offset: Offset(offset, offset),
              color: Colors.black38,
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: customText(
          '${widget.number}',
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }
}
