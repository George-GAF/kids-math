import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import '../widget/drag_and_drop_widget/target_widget.dart';
import 'app_size.dart';
import 'create_numbers.dart';
import 'puzzle.dart';
import 'shape.dart';

class ColorAndShapePuzzle extends Puzzle {

  static const _shapeCount = 16;

  static const List<Color> _shapeColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo
  ];

  bool _isDone = false;

  List<TargetWidget> _targetList = [];
  List<Shape> _shapes = [];
  List<Shape> _targetShapes = [];
  List<double> _leftListPos = [];
  List<double> _topListPos = [];
  //List<TargetWidget> _targetList = [];
  List<bool> _acceptedIndex = List.generate(_shapeCount, (index) => false);

  List<Shape> get shapes => _shapes;
  List<Shape> get targetShapes => _targetShapes;
  List<double> get leftListPos => _leftListPos;
  List<double> get topListPos => _topListPos;
  List<bool> get acceptedIndex => _acceptedIndex;
  //List<TargetWidget> get targetList => _targetList;
  bool get isDone => _isDone;


  @override
  void copyData(Puzzle source) {
    resetValue();
    var _source = source as ColorAndShapePuzzle;
    _shapes.addAll(_source.shapes);
    _targetShapes.addAll(_source.targetShapes);
    _leftListPos.addAll(_source.leftListPos);
    _topListPos.addAll(_source.topListPos);
  }

  int getCellCount() {
    return _shapeCount;
  }

  double getTargetSize() {
    return (AppSize().getWidth() - 20) * .2; //156.1
  }

  double getPlayAreaSize() {
    return AppSize().getHeight() - 20; //280
  }

  List<Shape> getListShapes(bool isTarget) {
    return isTarget ? _targetShapes : _shapes;
  }

  void updateShapes(int index) {
    _acceptedIndex[index] = true;
    var isAllAccepted = _testIfAllAccepted();
    if (isAllAccepted) {
      _isDone = true;
    }
  }

  bool _testIfAllAccepted() {
    return !_acceptedIndex.contains(false);
  }

  List<Shape> blank() {
    return List<Shape>.generate(getCellCount(),
            (index) => Shape(BoxShape.rectangle, Colors.transparent));
  }

  void addToList(TargetWidget target) {
    _targetList.add(target);
  }
  //mange
  void _restTargetsListState(){
    for (var target in _targetList) {
      target.key?.currentState?.rest();
    }
  }

  @override
  void createData() {
    resetValue();
    for (int i = 0; i < _shapeCount; i++) {
      var indexColor = GetNumbers().getNumbers(0, _shapeColors.length)[0];
      var indexType = GetNumbers().getNumbers(0, BoxShape.values.length)[0];
      Shape shape = Shape(BoxShape.values[indexType], _shapeColors[indexColor]);
      var constV = (Random().nextInt(6) + 2) / 10;
      var top = ((i + 1) / 4).ceil() * (getTargetSize() / 2 * constV);
      var left = (i % 4) * (getTargetSize() / 2 * constV);

      _shapes.add(shape);
      _targetShapes.add(shape);
      _topListPos.add(top);
      _leftListPos.add(left);
      dev.log(shape.name());
    }

  }

  void resetValue() {
    _restTargetsListState();
    _targetList = [];
    _isDone = false;
    _shapes = [];
    _targetShapes = [];
    _leftListPos = [];
    _topListPos = [];
    _acceptedIndex = List.generate(_shapeCount, (index) => false);
    //_targetList = [];
  }
}
