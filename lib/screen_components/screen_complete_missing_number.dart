import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../helper/app_size.dart';
import '../helper/create_numbers.dart';
import '../provider/board_provider.dart';
import '../widget/board.dart';
import '../widget/message_image.dart';
import '../widget/screen_complete_missing_numbers/number_container.dart';

class ScreenCompleteMissingNumber extends StatefulWidget {
  const ScreenCompleteMissingNumber(
      {super.key,
      required this.min,
      required this.max,
      required this.isAscending});

  final int min;
  final int max;
  final bool isAscending;

  @override
  State<ScreenCompleteMissingNumber> createState() =>
      _ScreenCompleteMissingNumberState();
}

class _ScreenCompleteMissingNumberState
    extends State<ScreenCompleteMissingNumber> {
  List<bool> _answerState = [];
  bool isAnimDone = true;
  //bool isDone = false;
  int number = 0;
  var height = AppSize().getHeight() - blockArea;
  late double size;
  late double width;
  late int index;
  late double scrWidth;

  @override
  void initState() {
    super.initState();
    // TODO : convert hard number to variable
    size = height / 4;
    width = size * 6 + (5 * 5);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateAnswerState(int index, bool state) {
    _answerState[index] = state;
    isAllRight();
  }

  void isAllRight() {
    bool tempResult =
        _answerState.where((element) => element).length == _answerState.length;

    if (tempResult) {
      Future.microtask(() {
        setState(() {
          isAnimDone = false;
        });
      });

      context.read<BoardProvider>().resetValue();
      context.read<BoardProvider>().turnClearTrue();

      Future.delayed(const Duration(milliseconds: timeToShowMessageInMill), () {
        setState(() {
          isAnimDone = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    scrWidth = MediaQuery.of(context).size.width;
    //if (isAnimDone) {
    number = GetNumbers().getNumbers(widget.min, widget.max)[0];
    index = -1;
    _answerState = [];
    //}
    log('fun build');
    log('isanim : $isAnimDone');
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              width: width,
              child: GridView.builder(
                itemCount: numberCellForCompleteMissingNumber,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (cont, i) {
                  var numbers = GetNumbers().getNumbers(0, 2);
                  var isMissing = numbers[0] + numbers[1] == 0;
                  if (isMissing) {
                    _answerState.add(false);
                    index++;
                  }
                  return NumberContainer(
                    size: size,
                    onTap: () {
                      context.read<BoardProvider>().updateIndex(i);
                      //  log('on tap i = $i');
                    },
                    index: i,
                    isMissing: isMissing,
                    isAscending :widget.isAscending,
                    number: !isAnimDone
                        ? 0
                        : widget.isAscending
                            ? number + i
                            : number - i,
                    updateAnswerState: updateAnswerState,
                    answerIndex: index,
                  );
                },
              ),
            ),
            Board(
              getValue: (value) {
                context.read<BoardProvider>().updateNumberTyped(value);
                // log('get value = $value');
              },
            )
          ],
        ),
        isAnimDone
            ? const SizedBox()
            : const MessageImage(
                imagePath: '${wordPath}EXCELLENT.png',
              ),
      ],
    );
  }
}
