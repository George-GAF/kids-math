import 'package:flutter/material.dart';

import '../constant/enum_file.dart';
import '../helper/create_numbers.dart';

class ScreenTwoController extends ChangeNotifier {
  List<int> _numbers = [];
  RotateDir _rotateDir = RotateDir.none;
  bool _isRefresh = false;

  List<int> get numbers => _numbers;
  RotateDir get rotateDir => _rotateDir;
  bool get isRefresh => _isRefresh;

  void setValues(int min, int max) {
    _createNumbers(min, max);
    _updateDir();
  }

  void _createNumbers(int min, int max) {
    _numbers = GetNumbers().getNumbers(min, max);
  }

  void updateIsRefresh(bool refresh) {
    _isRefresh = refresh;
    if (refresh) notifyListeners();
  }

  void _updateDir() {
    int one = numbers[0];
    int two = numbers[1];
    _rotateDir = one > two
        ? RotateDir.left
        : one < two
            ? RotateDir.right
            : RotateDir.none;
  }

  void resetValue() {
    _numbers = [];
    _rotateDir = RotateDir.none;
    _isRefresh = false;
  }
}
