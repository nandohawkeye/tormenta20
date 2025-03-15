// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:tormenta20/src/modules/home/modules/menace/menace_storage_service.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board.dart';
import 'package:uuid/uuid.dart';

class MenaceStore extends ChangeNotifier {
  MenaceStore(Menace initial) {
    _menace = initial;
    _setSub(initial.uuid);
  }

  StreamSubscription? _subMenace;
  StreamSubscription? _subBoard;
  Function? forcePopScreen;
  final _storageService = MenaceStorageService();

  void _setSub(String uuid) async {
    await _storageService.watchMenace(uuid).then((resp) {
      if (resp.menace != null) {
        _subMenace ??= resp.menace!.listen((result) {
          if (result != null) {
            changeMenace(result);
          } else {
            if (forcePopScreen != null) {
              forcePopScreen!();
            }
          }
        });
      }
    });

    await _storageService.watchBoardsWithLinkMenace().then((resp) {
      if (resp.boards != null) {
        _subBoard ??= resp.boards!.listen((result) {
          changeBoards(result);
        });
      }
    });
  }

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  void changeTabIndex(int value) {
    _tabIndex = value;
    notifyListeners();
  }

  late Menace _menace;
  Menace get menace => _menace;
  void changeMenace(Menace value) {
    _menace = value;
    notifyListeners();
  }

  void addLinkToBoard(Board board) async {
    final link = MenaceLinkBoard(
      uuid: const Uuid().v4(),
      menaceUuid: _menace.uuid,
      boardUuid: board.uuid,
    );
    await _storageService.addLinkMenaceBoard(entity: link);
  }

  void removeLinkToBoard(Board board) async {
    await _storageService.removeLinkMenaceBoard(
        menaceUuid: _menace.uuid, boardUuid: board.uuid);
  }

  void deleteMenace() async {
    await _storageService.deleteMenace(entity: _menace);
  }

  List<Board> _boards = [];
  List<Board> get boards => _boards;
  void changeBoards(List<Board> value) {
    _boards.clear();
    _boards.addAll(value);
    notifyListeners();
  }

  @override
  void dispose() {
    _subMenace?.cancel();
    _subMenace = null;
    _subBoard?.cancel();
    _subBoard = null;
    super.dispose();
  }
}
