import 'package:flutter/material.dart';

class AboutStore extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;
  void changeCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
