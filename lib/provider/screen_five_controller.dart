import 'package:flutter/material.dart';

import '../helper/create_numbers.dart';

class ScreenFiveController extends ChangeNotifier {
  static const _listLen = 4;
  bool _isAllCorrect = false;
  List<List<int>> _question = [];
  List<List<int>> _userAnswer = List.generate(_listLen, (index) => [0, 0]);
  List<bool> _isCorrect = List.generate(_listLen, (index) => false);
  bool get isAllCorrect => _isAllCorrect;
  List<List<int>> get question => _question;
  List<List<int>> get userAnswer => _userAnswer;
  List<bool> get isCorrect => _isCorrect;

  void createQuestionList() {
    for (int i = 0; i < _listLen; i++) {
      var numbers = GetNumbers().getNumbers(1, 6);
      _question.add(numbers);
    }
  }

  int listLength() {
    return _listLen;
  }

  void updateUserAnswer(int index, List<int> answer) {
    _userAnswer[index] = answer;
  }

  void isCorrectUpdate(int index) {
    var q = _question[index];
    var a = _userAnswer[index];
    var comparisonResult = q[0] == a[0] && q[1] == a[1];
    _isCorrect[index] = comparisonResult;
    notifyListeners();
  }

  void testIsAllCorrect() {
    var temp = _isCorrect.every((i) => i);
    if (temp) {
      _isAllCorrect = true;
      notifyListeners();
    }
  }

  void resetValue() {
    _isAllCorrect = false;
    _question = [];
    _isCorrect = List.generate(_listLen, (index) => false);
    _userAnswer = List.generate(_listLen, (index) => [0, 0]);

  }
}
