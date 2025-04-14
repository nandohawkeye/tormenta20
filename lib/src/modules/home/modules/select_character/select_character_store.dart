// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/select_character/select_character_storage_service.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/entities/character_board_adapters.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';

class SelectCharacterStore extends ChangeNotifier {
  SelectCharacterStore(this._boardUuid) {
    _storageService.wachCharacters().then((resp) {
      if (resp.characters != null) {
        _subCharacters ??= resp.characters?.listen(_setCharacters);
      }
    });
  }

  final String _boardUuid;

  StreamSubscription? _subCharacters;
  final _storageService = SelectCharacterStorageService();

  Future<Failure?> saveCharacterBoard(Character character) async {
    final characterBoard =
        CharacterBoardAdapters.createFromCharacter(character, _boardUuid);

    return await _storageService.saveCharacterBoard(characterBoard);
  }

  List<Character> _characters = [];
  List<Character> get characters => _characters;
  void _setCharacters(List<Character> values) {
    _characters.clear();
    _characters.addAll(values);
    notifyListeners();
  }

  Character? _selected;
  Character? get selected => _selected;
  void setSelectedCharacter(Character value) {
    _selected = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _subCharacters?.cancel();
    _subCharacters = null;
    super.dispose();
  }
}
