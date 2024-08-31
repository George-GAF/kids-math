import 'package:flutter/material.dart';

import '../constant/constant.dart';

class MassageProvider extends ChangeNotifier {
  bool _isRight = false;
  bool _isAnimDone = true;

  bool get isRight => _isRight;
  bool get isAnimDone => _isAnimDone;

  void switchAnimState() {
    _isAnimDone = !_isAnimDone;
    notifyListeners();
  }

  void updateIsRight(bool isRight) {
    _isRight = isRight;
    notifyListeners();
  }

  String getImagePath() {
    return _isRight ? '${wordPath}EXCELLENT.png' : '${wordPath}WRONG.png';
  }

  void resetValue() {
    _isRight = false;
    _isAnimDone = true;
  }
}
