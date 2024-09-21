import 'package:flutter/material.dart';
import '../../constant/enum_file.dart';
import '../shapes_value.dart';
import 'puzzle.dart';

class ShapeValuePuzzle extends Puzzle {
  final List<ShapesValue> _shapesValue = [
    ShapesValue(1, ShapesName.square),
    ShapesValue(2, ShapesName.plus),
    ShapesValue(3, ShapesName.diamond),
    ShapesValue(4, ShapesName.rectangle),
    ShapesValue(5, ShapesName.hash),
    ShapesValue(6, ShapesName.circle)
  ];
  List<ShapesValue> _shuffleList = [];
  List<ShapesValue> get shapeValueList => _shapesValue;
  List<ShapesValue> get shuffleList => _shuffleList;

  List<bool> _isAllRight = [];
  List<bool> get isAllRight => _isAllRight;

  int getLen() {
    return _shapesValue.length;
  }

  void updateState(int index, bool state) {
    _isAllRight[index] = state;
  }

  bool testIsAllRight() {
    return !_isAllRight.contains(false);
  }

  List<Widget>? getShapesList() {
    return _shuffleList.map((e) => e.getShape()).toList();
  }

  List<int> getValuesList() {
    return _shuffleList.map((e) => e.value).toList();
  }

  @override
  void copyData(Puzzle source) {
    var shapesValue = source as ShapeValuePuzzle;
    _shuffleList = [];
    _isAllRight = [];
    _shuffleList.addAll(shapesValue.shuffleList);
    _isAllRight.addAll(shapesValue.isAllRight);
    //  dev.log('copy data from shape value puzzle $_isAllRight');
  }

  @override
  void createData() {
    _isAllRight = [];
    _shuffleList = [];
    _isAllRight = List.generate(_shapesValue.length, (index) => false);
    _shuffleList.addAll(_shapesValue);
    _shuffleList.shuffle();
  }
}
