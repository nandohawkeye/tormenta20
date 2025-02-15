// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character_classe.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:uuid/uuid.dart';

class AddEditBoardPlayerStore {
  AddEditBoardPlayerStore(BoardPlayer? initialValue, String boardUuid) {
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
      _life = initialValue.life;
      _mana = initialValue.mana;
      _defense = initialValue.defense;
      _isAlive = initialValue.isAlive;
    } else {
      _characterUuid = const Uuid().v4();
      _isAlive = true;
    }
  }

  final ValueNotifier<bool> errorValidadeBrood = ValueNotifier<bool>(false);
  final ValueNotifier<bool> errorValidadeClasses = ValueNotifier<bool>(false);

  late String _characterUuid;
  late String _boardUuid;
  late bool _isAlive;
  DateTime? _createdAt;

  int? _life;
  int? get life => _life;
  void onChangeLife(String? value) => _life = int.parse(value ?? '1');

  int? _mana;
  int? get mana => _mana;
  void onChangeMana(String? value) => _mana = int.parse(value ?? '1');

  int? _defense;
  int? get defense => _defense;
  void onChangeDefense(String? value) => _defense = int.parse(value ?? '1');

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
      life: _life!,
      mana: _mana!,
      defense: _defense!,
      isAlive: _isAlive,
    );

    return character;
  }
}
