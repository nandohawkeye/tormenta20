// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:collection/collection.dart';

import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_ext.dart';
import 'package:uuid/uuid.dart';

class BoardSessionsStore extends ChangeNotifier {
  BoardSessionsStore(this._boardUuid) {
    _dao.watchSessions(_boardUuid).then((resp) {
      if (resp.sessions != null) {
        _sub ??= resp.sessions?.listen(_putSessions);
      }
    });
  }

  late final String _boardUuid;
  StreamSubscription? _sub;
  final _dao = GetIt.I<AppDatabase>().boardDAO;

  List<BoardSession> _sessions = [];
  List<BoardSession> get sessions => _sessions;
  void _putSessions(List<BoardSession> sessions) {
    _sessions = sessions;
    notifyListeners();
  }

  BoardSession? get currentSession =>
      _sessions.firstWhereOrNull((s) => s.isOpen);

  void createCloseSession() async {
    if (currentSession == null) {
      final session = BoardSession(
        uuid: const Uuid().v4(),
        boardUuid: _boardUuid,
        startedAt: DateTime.now(),
        combats: [],
      );

      await _dao.saveSession(session);
      return;
    }

    final closeSession = currentSession!.copyWith(endAt: DateTime.now());
    await _dao.saveSession(closeSession);
  }

  void createCloseCombat() async {
    if (currentSession == null) return;

    final combats = currentSession!.combats.where((cs) => cs.isOpen).toList();

    if (combats.isNotEmpty) {
      combats.sort((a, b) => b.startedAt.compareTo(a.startedAt));
      final currentCombat = combats.first.copyWith(endAt: DateTime.now());
      await _dao.saveCombat(currentCombat);
      return;
    }

    final combat = BoardCombat(
      uuid: const Uuid().v4(),
      boardUuid: _boardUuid,
      sessionUuid: currentSession!.uuid,
      startedAt: DateTime.now(),
      turn: 1,
    );
    await _dao.saveCombat(combat);
  }

  BoardCombat? getCurrentCombat() {
    final combats = currentSession!.combats.where((cs) => cs.isOpen).toList();

    if (combats.isEmpty) return null;

    combats.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    final currentCombat = combats.first.copyWith(endAt: DateTime.now());

    return currentCombat;
  }

  @override
  void dispose() {
    _sub?.cancel();
    _sub = null;
    super.dispose();
  }
}
