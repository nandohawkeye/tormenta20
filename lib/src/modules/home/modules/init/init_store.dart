// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';

class InitBoardStore extends ChangeNotifier {
  StreamSubscription? _subBoards;

  Future<InitBoardStore> init() async {
    await GetIt.I<AppDatabase>().boardDAO.watchBoards().then((resp) {
      if (resp.boards != null) {
        _subBoards ??= resp.boards?.listen(_setData);
      }
    });

    return this;
  }

  List<Board> _data = [];
  List<Board> get data => _data;
  void _setData(List<Board> values) {
    _data.clear();
    _data.addAll(values);
    notifyListeners();
  }
}
