import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/board_view_storage_service.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_ext.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:uuid/uuid.dart';

class BoardViewStore extends ChangeNotifier {
  BoardViewStore(this._board) {
    _storageService.watchSingleBoard(_board.uuid).then((resp) {
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

  Future<Failure?> deleteBoard(Board board) =>
      _storageService.deleteBoard(board);

  Future<void> saveBoardPlayer(BoardPlayer player) async {
    await _storageService.saveBoardPlayer(player);
  }

  Future<void> deleteBoardPlayer(BoardPlayer player) async {
    await _storageService.deleteBoardPlayer(player);
  }

  Future<void> saveBaordCharacter(CharacterBoard character) async {
    await _storageService.saveBoardCharacter(character);
  }

  Future<void> deleteBoardCharacter(CharacterBoard character) async {
    await _storageService.deleteBoardCharacter(character);
  }

  StreamSubscription? _sub;
  final _storageService = BoardViewStorageService();

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

      await _storageService.saveSession(session);
      return;
    }

    sessions.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    final closeSession = sessions.first.copyWith(endAt: DateTime.now());
    await _storageService.saveSession(closeSession);
  }

  void createCloseCombat() async {
    final sessions = board.sessions.where((ss) => ss.isOpen).toList();

    if (sessions.isEmpty) return;

    final combats = board.combats.where((cs) => cs.isOpen).toList();

    if (combats.isNotEmpty) {
      combats.sort((a, b) => b.startedAt.compareTo(a.startedAt));
      final currentCombat = combats.first.copyWith(endAt: DateTime.now());
      await _storageService.saveCombat(currentCombat);
      return;
    }

    sessions.sort((a, b) => a.startedAt.compareTo(b.startedAt));
    final currentSession = sessions.first;
    final combat = BoardCombat(
      uuid: const Uuid().v4(),
      boardUuid: _board.uuid,
      sessionUuid: currentSession.uuid,
      startedAt: DateTime.now(),
      turn: 1,
    );
    await _storageService.saveCombat(combat);
  }

  BoardCombat? getCurrentCombat() {
    final sessions = board.sessions.where((ss) => ss.isOpen).toList();

    if (sessions.isEmpty) return null;

    final combats = board.combats.where((cs) => cs.isOpen).toList();

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
