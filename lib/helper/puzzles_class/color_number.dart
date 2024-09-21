import 'dart:math';

import 'package:flutter/material.dart';

import 'puzzle.dart';

class ColorNumber extends Puzzle {
  final List<Color> _colors = [
    Colors.blue,
    Colors.orange,
    Colors.indigo,
    Colors.green,
    Colors.limeAccent,
    Colors.purple,
    Colors.cyan,
    Colors.brown,
  ];

  bool _isDone = false;
  Color _selected = Colors.white;
  List<int> _colorsIndex = [];
  List<Color> _colorList = [];
  List<Color> get colorList => _colorList;
  int get colorCount => _colors.length;
  Color get selected => _selected;
  List<bool> _resultState = [];
  bool get isDone => _isDone;
  List<bool> get resultState => _resultState;

  void setSelected(Color current) {
    _selected = current;
  }

  int ballCount() {
    return _colors.length*3 ;
  }

  void updateResultState(int index, bool state) {
    _resultState[index] = state;
    _isDone = !_resultState.contains(false);
  }

  void _setColorsIndex() {
    _colorsIndex = [];
    var indexes = List.generate(_colors.length, (index) => index);
    for (int i = 0; i < _colors.length; i++) {
      var index = Random().nextInt(indexes.length);
      _colorsIndex.add(indexes[index]);
      indexes.removeAt(index);
    }
  }

  void _setColors() {
    _colorList = [];
    for (int i = 0; i < _colors.length; i++) {
      colorList.add(_colors[_colorsIndex[i]]);
    }
  }

  @override
  void copyData(Puzzle source) {
    var colorNumber = source as ColorNumber;
    _colorList.clear();
    _colorList.addAll(colorNumber.colorList);
    _resultState.clear();
    _resultState.addAll(colorNumber.resultState);
  }

  @override
  void createData() {
    _setColorsIndex();
    _setColors();
    _resultState = [];
    _resultState = List.generate(ballCount(), (index) => false);
  }
}
