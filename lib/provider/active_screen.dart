import 'package:flutter/material.dart';

class ActiveScreen extends ChangeNotifier {
  int _selectedIndex = 0;
  int _contentIndex = 0 ;
  int _backGroundIndex = 0;
  int get contentIndex => _contentIndex;
  int get selectedIndex => _selectedIndex;
  int get backGroundIndex => _backGroundIndex;

  void updateBackGroundIndex(int index){
    _backGroundIndex = index;
    notifyListeners();
  }

  void updateIndex(int index) {
    _selectedIndex = index; // Update the index on button tap
    notifyListeners();
  }

  void updateContentIndex(int index){
    _contentIndex = index;
    notifyListeners();
  }

}
