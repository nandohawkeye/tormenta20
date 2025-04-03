import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/equipament/classe_character_adapters.dart';

abstract class BoardPlayerAdapters {
  static BoardPlayerTableCompanion toCompanion(BoardPlayer entity) {
    return BoardPlayerTableCompanion(
      uuid: Value<String>(entity.uuid),
      boardUuid: Value<String>(entity.boardUuid),
      characterName: Value<String>(entity.characterName),
      playerName: Value<String>(entity.playerName),
      imagePath: Value<String?>(entity.imagePath),
      imageAsset: Value<String?>(entity.imageAsset),
      broodIndex: Value<int>(entity.brood.index),
      createdAt: Value<int>(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value<int>(entity.updatedAt.millisecondsSinceEpoch),
      isAlive: Value<bool>(entity.isAlive),
      life: Value<int>(entity.life),
      mana: Value<int>(entity.mana),
      defense: Value<int>(entity.defense),
      initiative: Value<int>(entity.initiative),
      classeIndexes: Value(
        ClasseCharacterAdapters.toStringValue(entity.classes),
      ),
    );
  }

  static BoardPlayer fromDriftData(BoardPlayerTableData data) {
    final classes = ClasseCharacterAdapters.fromString(data.classeIndexes);

    return BoardPlayer(
      playerName: data.playerName,
      uuid: data.uuid,
      boardUuid: data.boardUuid,
      characterName: data.characterName,
      brood: Brood.values[data.broodIndex],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
      classes: classes,
      imageAsset: data.imageAsset,
      imagePath: data.imagePath,
      life: data.life,
      mana: data.mana,
      defense: data.defense,
      isAlive: data.isAlive,
      initiative: data.initiative,
    );
  }

  static BoardPlayer fromJson(Map<String, dynamic> data) {
    final classes = ClasseCharacterAdapters.fromString(data['classe_indexes']);
    final now = DateTime.now();

    return BoardPlayer(
      playerName: data['player_name'],
      uuid: data['uuid'],
      boardUuid: data['board_uuid'],
      characterName: data['character_name'],
      brood: Brood.values[data['brood_index']],
      createdAt: now,
      updatedAt: now,
      classes: classes,
      imageAsset: data['image_asset'],
      imagePath: null,
      life: data['life'],
      mana: data['mana'],
      defense: data['defense'],
      isAlive: true,
      initiative: data['initiative'],
    );
  }
}
