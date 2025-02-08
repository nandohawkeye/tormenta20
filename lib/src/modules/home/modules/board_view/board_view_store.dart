import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';

class BoardViewStore extends ChangeNotifier {
  BoardViewStore(this._board) {
    _dao.watchSingleBoard(_board.uuid).then((resp) {
      if (resp.boards != null) {
        _sub ??= resp.boards?.listen((data) {
          if (data != null) {
            _board = data;
          } else {
            _boardDeleted = true;
          }

          notifyListeners();
        });
      }
    });
  }

  StreamSubscription? _sub;

  final _dao = GetIt.I<AppDatabase>().boardDAO;
  late Board _board;
  Board get board => _board;

  bool _boardDeleted = false;
  bool get boardDeleted => _boardDeleted;

  @override
  void dispose() {
    _sub?.cancel();
    _sub = null;
    super.dispose();
  }
}
