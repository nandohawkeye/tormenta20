// ignore_for_file: prefer_final_fields

import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/stores/add_edit_board_player_brood_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/stores/add_edit_board_player_classes_store.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:uuid/uuid.dart';

class AddEditBoardPlayerController {
  AddEditBoardPlayerController(BoardPlayer? initialValue, String boardUuid) {
    _boardUuid = boardUuid;
    if (initialValue != null) {
      _createdAt = initialValue.createdAt;
      _characterUuid = initialValue.uuid;
      _characterName = initialValue.characterName;
      _player = initialValue.playerName;
      _assetPath = initialValue.imageAsset;
      _filePath = initialValue.imagePath;
      broodStore = AddEditBoardPlayerBroodStore(initialValue.brood);
      classesStore = AddEditBoardPlayerClassesStore(initialValue.classes);
      _life = initialValue.life;
      _mana = initialValue.mana;
      _defense = initialValue.defense;
      _isAlive = initialValue.isAlive;
      _initiative = initialValue.initiative;
    } else {
      broodStore = AddEditBoardPlayerBroodStore(null);
      classesStore = AddEditBoardPlayerClassesStore([]);

      _characterUuid = const Uuid().v4();
      _isAlive = true;
    }
  }

  late String _characterUuid;
  late String _boardUuid;
  late bool _isAlive;
  DateTime? _createdAt;

  int? _initiative;
  int? get initiative => _initiative;
  void onChangeInitiative(String? value) =>
      _initiative = int.parse(value ?? '1');

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

  late final AddEditBoardPlayerBroodStore broodStore;

  late final AddEditBoardPlayerClassesStore classesStore;

  BoardPlayer? onSave() {
    if (!broodStore.validate()) {
      return null;
    }

    if (!classesStore.validate()) {
      return null;
    }

    final updatedAt = DateTime.now();

    final character = BoardPlayer(
      imagePath: _filePath,
      imageAsset: _assetPath,
      playerName: _player!.trim(),
      uuid: _characterUuid,
      boardUuid: _boardUuid,
      characterName: _characterName!.trim(),
      brood: broodStore.data!,
      createdAt: _createdAt ?? updatedAt,
      updatedAt: updatedAt,
      classes: classesStore.data,
      life: _life!,
      mana: _mana!,
      defense: _defense!,
      isAlive: _isAlive,
      initiative: _initiative!,
    );

    return character;
  }

  dispose() {
    broodStore.dispose();
  }
}
