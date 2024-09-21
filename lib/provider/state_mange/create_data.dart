import 'package:flutter/material.dart';

import '../../helper/puzzles_class/color_and_shape_puzzle.dart';
import '../../helper/puzzles_class/detect_number_puzzle.dart';
import '../../helper/puzzles_class/puzzle.dart';

class CreateData extends ChangeNotifier {
  late Puzzle _puzzle;
  Puzzle get puzzle => _puzzle;

  void start() {
    _puzzle.createData();
  }

  Puzzle readData() {
    return _puzzle;
  }

  void assignToPuzzle(Puzzle puzzle) {
    _puzzle = puzzle;
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
