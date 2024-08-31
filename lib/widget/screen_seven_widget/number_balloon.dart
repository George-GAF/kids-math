import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../helper/app_size.dart';
import '../../provider/state_mange/update_ui.dart';
import '../cus_text.dart';

class NumberBalloon extends StatefulWidget {
  const NumberBalloon({
    super.key,
    required this.index,
  });
  final int index;
  @override
  State<NumberBalloon> createState() => _NumberBalloonState();
}

class _NumberBalloonState extends State<NumberBalloon> {
  final double _size = 70.0;
  Timer moving = Timer(const Duration(hours: 1), () {});
  final Duration duration =
      const Duration(milliseconds: timeToMoveBalloonNumber);
  bool isMustRest = false;
  late int number;
  late double left;
  late double bottom;
  late double maxX;
  late double maxY;
  late int index;

  late double distance;

  void generateValues() {
    bottom = -_size * 2;
    left = Random().nextInt(maxX.toInt()).toDouble(); //+ _size;
    number = Random().nextInt(9) + 1; // get number between 1 to 9
    distance = (Random().nextDouble() + .2) * (_size);
    isMustRest = false;
  }

  void goToZeroPoint() {
    isMustRest = true;
    bottom = -_size * 2;
    Timer(const Duration(milliseconds: timeToMoveBalloonNumber), () {
      generateValues();
    });
  }

  @override
  void initState() {
    maxX = AppSize().getWidth() - (_size * 2);
    maxY = AppSize().getHeight();
    index = widget.index;
    //--------------------------------------------------
    generateValues();
    Timer(Duration(milliseconds: timeToMoveBalloonNumber * index), () {
      var _lD = 2.0;
      moving = Timer.periodic(duration, (timer) {
        if (mounted) {
          setState(() {
            _lD = _lD * -1;
            left += _lD;
            if (bottom < maxY) {
              bottom += distance;
            } else {
              goToZeroPoint();
            }
          });
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    moving.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var upDateUi = context.read<UpdateUi>().numberPuzzle();
    var numberTarget = upDateUi.currentTarget;

    return AnimatedPositioned(
      left: left,
      bottom: bottom,
      duration: duration,
      child: GestureDetector(
        onTap: () {
          if (number == numberTarget) {
            upDateUi.updateScore();
            context.read<UpdateUi>().refresh();
            if (mounted) {
              setState(() {
                goToZeroPoint();
              });
            }
          }
        },
        child: Container(
          height: _size,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                Colors.transparent,
                isMustRest ? Colors.transparent : Colors.black26,
              ]),
              shape: BoxShape.circle),
          child: customText(
            '${isMustRest ? "" : number}',
          ),
        ),
      ),
    );
  }
}
