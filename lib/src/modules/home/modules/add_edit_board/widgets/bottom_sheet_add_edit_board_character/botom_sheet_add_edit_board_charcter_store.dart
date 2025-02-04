import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/board/board_character.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character_classe.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:uuid/uuid.dart';

class BotomSheetAddEditBoardCharcterStore {
  BotomSheetAddEditBoardCharcterStore(BoardCharacter? initialValue) {
    if (initialValue != null) {
      _characterUuid = initialValue.uuid;
      _name = initialValue.name;
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

  String? _name;
  String? get name => _name;
  void onChangeName(String? value) => _name = value;

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
        characterUuid: _characterUuid,
      );
      _classes.add(classe);
    }
  }

  void onSave() {
    errorValidadeBrood.value = false;
    errorValidadeClasses.value = false;

    if (_brood == null) {
      errorValidadeBrood.value = true;
      return;
    }

    if (_classes.isEmpty) {
      errorValidadeClasses.value = true;
      return;
    }
  }
}
