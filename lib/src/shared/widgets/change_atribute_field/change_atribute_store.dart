import 'package:flutter/material.dart';

class ChangeAtributeStore extends ChangeNotifier {
  ChangeAtributeStore(int initial) {
    _value = initial;
  }

  late int _value;
  int get value => _value;
  void increment() {
    _value++;
    notifyListeners();
  }

  void declement() {
    _value--;
    notifyListeners();
  }
}
