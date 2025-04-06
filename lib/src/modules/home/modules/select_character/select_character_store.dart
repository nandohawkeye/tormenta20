// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/select_character/select_character_storage_service.dart';
import 'package:tormenta20/src/shared/entities/character.dart';

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

  // Future<Failure?> addLinkMenaceBoard() {
  //   List<MenaceLinkBoard> entities = [];
  //   for (var menace in _selectedMenaces) {
  //     entities.add(MenaceLinkBoard(
  //       uuid: const Uuid().v4(),
  //       boardUuid: _boardUuid,
  //       menaceUuid: menace.uuid,
  //     ));
  //   }

  //   return _storageService.addLinkMenaceBoard(entities: entities);
  // }

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
