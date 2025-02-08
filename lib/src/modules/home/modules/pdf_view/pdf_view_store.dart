import 'package:flutter/material.dart';

class PdfViewStore extends ChangeNotifier {
  int _currentPage = 1;
  int get currentPage => _currentPage;
  void _setCurrentPage(int page) => _currentPage = page;

  int _pagesCount = 0;
  int get pagesCount => _pagesCount;
  void _setPagesCount(int page) => _pagesCount = page;
  bool get isOnlyPage => _pagesCount == 1;
  bool get enableIndicatorMorePages => _currentPage < _pagesCount;
  bool get isEnableLable => _pagesCount > 0;

  void changePage(int? current, int? count) {
    if (current == null || count == null) {
      return;
    }

    _setCurrentPage(current + 1);
    _setPagesCount(count);
    notifyListeners();
  }
}
