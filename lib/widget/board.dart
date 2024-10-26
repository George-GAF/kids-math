import 'dart:developer';

import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '../helper/sound_manager.dart';
import 'cus_text.dart';

double _avaWidth = 0;
double _height = 0;

class Board extends StatelessWidget {
  const Board({
    super.key,
    required this.getValue,
  });

  final Function(int value) getValue;

  @override
  Widget build(BuildContext context) {
    _avaWidth = MediaQuery.of(context).size.width * .25;
    _height = MediaQuery.of(context).size.height - blockArea;
    List<int> number = List.generate(11, (index) => index - 1);
    return SizedBox(
      width: _avaWidth,
      height: _height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BoardRow(
            list: number.sublist(8),
            getValue: getValue,
          ),
          _BoardRow(
            list: number.sublist(5, 8),
            getValue: getValue,
          ),
          _BoardRow(
            list: number.sublist(2, 5),
            getValue: getValue,
          ),
          _BoardRow(
            list: [number[1], number[0]],
            getValue: getValue,
          ),
        ],
      ),
    );
  }
}

class _BoardRow extends StatelessWidget {
  const _BoardRow({
    required this.list,
    required this.getValue,
  });
  final List<int> list;
  final Function(int value) getValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list
          .map(
            (e) => Expanded(
              child: _BoardButton(value: e, getValue: getValue),
            ),
          )
          .toList(),
    );
  }
}

class _BoardButton extends StatelessWidget {
  const _BoardButton({
    required this.value,
    required this.getValue,
  });
  final int value;
  final Function(int value) getValue;
  @override
  Widget build(BuildContext context) {
    var size = _avaWidth * .20;
    log("Width $_avaWidth ");
    log("size $size ");

    return TextButton(
      onPressed: () {
        SoundManager.sound.playSound(click);
        getValue(value);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(_avaWidth * .033),
        shape: const CircleBorder(),
        backgroundColor: Colors.amber,
        shadowColor: Colors.black,
        elevation: _avaWidth * .055,
      ),
      child: customText(
        '${value == -1 ? "DEL" : value}',
        fontColor: Colors.white,
        width: size,
        height: size,
      ),
    );
  }
}
