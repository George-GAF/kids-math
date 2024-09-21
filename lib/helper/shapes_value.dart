
import 'dart:math';

import 'package:flutter/material.dart';

import '../constant/enum_file.dart';

class ShapesValue {
  int value;
  ShapesName shape;
  late double _width;
  late double _fontSize;
  bool _isHaveText = false;
  double _turn = 1;
  double _size = 15;
  Color _color = Colors.white;
  Color _borderColor = Colors.lightGreenAccent;
  Widget _child = const SizedBox();
  late TextStyle _style;
  BoxShape _boxShape = BoxShape.rectangle;

  late Widget _widget;

  @override
  String toString() {
    return '$shape value : $value\n';
  }

  Widget getShape() {
    return _widget;
  }

  void setValues(double newSize,
      {color = Colors.white, borderColor = Colors.lightGreenAccent}) {
    _size = newSize;
    _color = color == Colors.transparent ? _color : color;
    _borderColor =
    borderColor == Colors.transparent ? _borderColor : borderColor;
    _initList();
  }

  ShapesValue(this.value, this.shape) {
    _initList();
  }

  void _initList() {
    _width = _size;
    _fontSize = _size * .8;
    _style = TextStyle(
      color: _color,
      fontWeight: FontWeight.bold,
      fontSize: _fontSize,
    );
    switch (shape) {
      case ShapesName.circle:
        _boxShape = BoxShape.circle;
        break;
      case ShapesName.rectangle:
        _width = _size * 1.3;
        break;
      case ShapesName.diamond:
        _turn = 4;
        break;
      case ShapesName.hash:
        _isHaveText = true;
        _child = Text(
          '#',
          textAlign: TextAlign.center,
          style: _style,
        );
        break;
      case ShapesName.plus:
        _isHaveText = true;
        _child = Text(
          '+',
          textAlign: TextAlign.center,
          style: _style,
        );
        break;
      case ShapesName.square:
        break;
    } // end switch
    _widget = Container(
      width: _size * 2,
      height: _size * 2,
      padding: EdgeInsets.all(_size * .14),
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(width: _size * .03, color: _borderColor),
          horizontal: BorderSide(width: _size * .06, color: _borderColor),
        ),
      ),
      child: Transform.rotate(
        angle: pi / _turn,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.all(_size * .14),
            width: _width,
            height: _size,
            decoration: BoxDecoration(
              shape: _boxShape,
              border: _isHaveText ? null : Border.all(color: _color),
            ),
            child: _child,
          ),
        ),
      ),
    );
  }
}
