import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/play_mode.dart';

class AboutStore extends ChangeNotifier {
  AboutStore() {
    _playMode = PlayMode.full;
  }

  late PlayMode _playMode;
  PlayMode get mode => _playMode;
  void changePlayMode(PlayMode value) {
    _playMode = value;
    notifyListeners();
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;
  void changeCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
