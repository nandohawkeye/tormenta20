import 'package:flutter/material.dart';

class HomeScreenStore extends ChangeNotifier {
  HomeScreenStore();

  int _index = 0;
  int _lastIndex = 0;

  //teste

  int get index => _index;
  int get lastIndex => _lastIndex;

  void changeIndex(int value) {
    if (value != _index) {
      _lastIndex = _index;
      _index = value;
      notifyListeners();
    }
  }
}
