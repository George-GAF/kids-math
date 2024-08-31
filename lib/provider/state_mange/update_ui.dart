import 'package:flutter/material.dart';

import '../../helper/color_and_shape_puzzle.dart';
import '../../helper/detect_number_puzzle.dart';
import '../../helper/puzzle.dart';

class UpdateUi extends ChangeNotifier {
  late Puzzle _puzzle;
  Puzzle get puzzle => _puzzle;

  void fillData(Puzzle source) {
    _puzzle.copyData(source);
  }

  void refresh(){
    notifyListeners();
  }

//--------------------------------------------------------------------------

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
