import 'package:flutter/material.dart';

class BoardProvider extends ChangeNotifier {
  int _indexTapped = -1;
  int _numberTyped = -1;
  bool _clear = false;

  int get indexTapped => _indexTapped;
  int get numberTyped => _numberTyped;
  bool get clear => _clear;

  void resetValue() {
    _indexTapped = -1;
    _numberTyped = -1;
    _clear = false;
  }

  void turnClearTrue() {
    _clear = true;
  }

  void updateIndex(int current) {
    resetValue();
    _indexTapped = current;
  }

  void updateNumberTyped(int newNumber) {
    String v = '${newNumber == -1 ? "" : newNumber}';
    if (_numberTyped == -1) {
      v = newNumber == -1 ? '' : newNumber.toString();
    } else {
      if (_numberTyped.toString().length == 2 && newNumber != -1) {
        return;
      }
      if (newNumber != -1) {
        v = '$numberTyped$newNumber';
      } else {
        String tem = _numberTyped.toString();
        v = tem.length > 1 ? tem.substring(0, tem.length - 1) : '';
      }
    }
    _numberTyped = v == '' ? -1 : int.parse(v);
    notifyListeners();
  }
}
