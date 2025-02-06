// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character_classe.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:uuid/uuid.dart';

class BotomSheetAddEditBoardPlayerStore {
  BotomSheetAddEditBoardPlayerStore(
      BoardPlayer? initialValue, String boardUuid) {
    _boardUuid = boardUuid;
    if (initialValue != null) {
      _createdAt = initialValue.createdAt;
      _characterUuid = initialValue.uuid;
      _characterName = initialValue.characterName;
      _player = initialValue.playerName;
      _assetPath = initialValue.imageAsset;
      _filePath = initialValue.imagePath;
      _brood = initialValue.brood;
      _classes.addAll(initialValue.classes);
    } else {
      _characterUuid = const Uuid().v4();
    }
  }

  final ValueNotifier<bool> errorValidadeBrood = ValueNotifier<bool>(false);
  final ValueNotifier<bool> errorValidadeClasses = ValueNotifier<bool>(false);

  late String _characterUuid;
  late String _boardUuid;

  DateTime? _createdAt;

  String? _characterName;
  String? get name => _characterName;
  void onChangeCharacter(String? value) => _characterName = value;

  String? _player;
  String? get player => _player;
  void onChangePlayer(String? value) => _player = value;

  String? _assetPath;
  String? get assetPath => _assetPath;
  void onChangeAssetPath(String? value) => _assetPath = value;

  String? _filePath;
  String? get filePath => _filePath;
  void onChangeFilePath(String? value) => _filePath = value;

  Brood? _brood;
  Brood? get brood => _brood;
  void onChangeBrood(Brood value) {
    _brood = value;
    errorValidadeBrood.value = false;
  }

  List<CharacterClasse> _classes = [];
  List<CharacterClasse> get classes => _classes;
  void onAddClasse(ClasseType value) {
    errorValidadeClasses.value = false;
    if (_classes.any((c) => c.type == value)) {
      _classes.removeWhere((cr) => cr.type == value);
    } else {
      final classe = CharacterClasse(
        type: value,
        uuid: const Uuid().v4(),
        playerUuid: _characterUuid,
      );
      _classes.add(classe);
    }
  }

  BoardPlayer? onSave() {
    errorValidadeBrood.value = false;
    errorValidadeClasses.value = false;

    if (_brood == null) {
      errorValidadeBrood.value = true;
      return null;
    }

    if (_classes.isEmpty) {
      errorValidadeClasses.value = true;
      return null;
    }

    final updatedAt = DateTime.now();

    final character = BoardPlayer(
      imagePath: _filePath,
      imageAsset: _assetPath,
      playerName: _player!,
      uuid: _characterUuid,
      boardUuid: _boardUuid,
      characterName: _characterName!,
      brood: _brood!,
      createdAt: _createdAt ?? updatedAt,
      updatedAt: updatedAt,
      classes: _classes,
    );

    return character;
  }
}
