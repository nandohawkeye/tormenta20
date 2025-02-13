import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_ext.dart';
import 'package:uuid/uuid.dart';

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

  void createCloseSession() async {
    final sessions = board.sessions.where((ss) => ss.isOpen).toList();

    if (sessions.isEmpty) {
      final session = BoardSession(
        uuid: const Uuid().v4(),
        boardUuid: _board.uuid,
        startedAt: DateTime.now(),
        combats: [],
      );

      await _dao.saveSession(session);
      return;
    }

    sessions.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    final closeSession = sessions.first.copyWith(endAt: DateTime.now());
    await _dao.saveSession(closeSession);
  }

  void createCloseCombat() async {
    final sessions = board.sessions.where((ss) => ss.isOpen).toList();

    if (sessions.isEmpty) return;

    final combats = board.combats.where((cs) => cs.isOpen).toList();

    if (combats.isNotEmpty) {
      combats.sort((a, b) => b.startedAt.compareTo(a.startedAt));
      final currentCombat = combats.first.copyWith(endAt: DateTime.now());
      await _dao.saveCombat(currentCombat);
      return;
    }

    sessions.sort((a, b) => a.startedAt.compareTo(b.startedAt));
    final currentSession = sessions.first.copyWith(endAt: DateTime.now());
    final combat = BoardCombat(
      uuid: const Uuid().v4(),
      boardUuid: _board.uuid,
      sessionUuid: currentSession.uuid,
      startedAt: DateTime.now(),
    );
    await _dao.saveCombat(combat);
  }

  @override
  void dispose() {
    _sub?.cancel();
    _sub = null;
    super.dispose();
  }
}
