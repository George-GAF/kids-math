import 'package:flutter/material.dart';
import '../../helper/detect_number_puzzle.dart';
import '../../helper/puzzle.dart';

import '../../helper/color_and_shape_puzzle.dart';

class CreateData extends ChangeNotifier {
  late Puzzle _puzzle ;
  Puzzle get puzzle => _puzzle;

  void start() {
    _puzzle.createData();
  }

  Puzzle readData() {
    return _puzzle;
  }

//-----------------------------------------------------------------

  void assignTODetectNumberPuzzle() {
    _puzzle = DetectNumberPuzzle();
  }

  DetectNumberPuzzle numberPuzzle() {
    return _puzzle as DetectNumberPuzzle;
  }

  void assignToColorAndShapePuzzle() {
    _puzzle = ColorAndShapePuzzle();
  }

  ColorAndShapePuzzle shapePuzzle() {
    return _puzzle as ColorAndShapePuzzle;
  }
}
