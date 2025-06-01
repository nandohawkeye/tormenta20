// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/board_sessions_storage_service.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_ext.dart';
import 'package:uuid/uuid.dart';

class BoardSessionsStore extends ChangeNotifier {
  BoardSessionsStore(this._boardUuid) {
    _storageService.watchSessions(_boardUuid).then((resp) {
      if (resp.sessions != null) {
        _sub ??= resp.sessions?.listen(_putSessions);
      }
    });
  }

  late final String _boardUuid;
  StreamSubscription? _sub;
  final _storageService = BoardSessionsStorageService();

  List<BoardSession> _sessions = [];
  List<BoardSession> get sessions => _sessions;
  void _putSessions(List<BoardSession> sessions) {
    _sessions = sessions;
    notifyListeners();
  }

  BoardSession? get currentSession =>
      _sessions.firstWhereOrNull((s) => s.isOpen);

  void updateSession(BoardSession session) async {
    await _storageService.saveSession(session);
  }

  void createCloseSession() async {
    if (currentSession == null) {
      final now = DateTime.now();
      final session = BoardSession(
        uuid: const Uuid().v4(),
        boardUuid: _boardUuid,
        startedAt: now,
        updatedAt: now,
        combats: [],
      );

      await _storageService.saveSession(session);
      return;
    }

    final now = DateTime.now();
    final closeSession = currentSession!.copyWith(endAt: now, updatedAt: now);
    await _storageService.saveSession(closeSession);
  }

  void createCloseCombat() async {
    if (currentSession == null) return;

    final combats = currentSession!.combats.where((cs) => cs.isOpen).toList();

    if (combats.isNotEmpty) {
      combats.sort((a, b) => b.startedAt.compareTo(a.startedAt));
      final currentCombat = combats.first.copyWith(endAt: DateTime.now());
      await _storageService.saveCombat(currentCombat);
      return;
    }

    final combat = BoardCombat(
      uuid: const Uuid().v4(),
      boardUuid: _boardUuid,
      sessionUuid: currentSession!.uuid,
      startedAt: DateTime.now(),
      turn: 1,
    );
    await _storageService.saveCombat(combat);
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
