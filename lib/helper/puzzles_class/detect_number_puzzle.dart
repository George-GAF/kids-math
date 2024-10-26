
import 'dart:math';

import 'puzzle.dart';

class DetectNumberPuzzle extends Puzzle {
  final List<String> _target = [
    '',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
  ];

  int _score = 0;
  int _currentTarget = 1;
  int get score => _score;
  int get currentTarget => _currentTarget;

  void updateScore() {
    ++_score;
  }

  @override
  void createData() {
    _currentTarget = 1 + Random().nextInt(_target.length - 1);
  }

  void changeTarget(){

  }

  @override
  void copyData(Puzzle source) {
    var tSource = source as DetectNumberPuzzle;
    _currentTarget = tSource.currentTarget;
  }

  String target(){
    return _target[currentTarget];
  }

  void restValue() {
    _score = 0;
    _currentTarget = 1;
  }
}
