// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/character/character_storage_service.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/character.dart';

class CharacterStore extends ChangeNotifier {
  CharacterStore(Character initial) {
    _character = initial;
    _setSub(initial.uuid);
  }

  StreamSubscription? _subCharacter;
  StreamSubscription? _subBoard;
  Function? forcePopScreen;
  final _storageService = CharacterStorageService();

  void _setSub(String uuid) async {
    await _storageService.watchCharacter(uuid).then((resp) {
      if (resp.character != null) {
        _subCharacter ??= resp.character!.listen((result) {
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

    await _storageService.watchOnlyBoardsToCharacters().then((resp) {
      if (resp.boards != null) {
        _subBoard ??= resp.boards!.listen((result) {
          changeBoards(result);
        });
      }
    });
  }

  void deleteCharacter() => _storageService.deleteCharacter(_character);

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  void changeTabIndex(int value) {
    _tabIndex = value;
    notifyListeners();
  }

  late Character _character;
  Character get character => _character;
  void changeMenace(Character value) {
    _character = value;
    notifyListeners();
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
    _subCharacter?.cancel();
    _subCharacter = null;
    _subBoard?.cancel();
    _subBoard = null;
    super.dispose();
  }
}
