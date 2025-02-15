import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/entities/board/board_player_dto.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character_classe_adapters.dart';

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
      createdAt: Value<DateTime>(entity.createdAt),
      updatedAt: Value<DateTime>(entity.updatedAt),
      isAlive: Value<bool>(entity.isAlive),
      life: Value<int>(entity.life),
      mana: Value<int>(entity.mana),
      defense: Value<int>(entity.defense),
    );
  }

  static BoardPlayer fromDriftDto(BoardPlayerDto dto) {
    final classes =
        dto.classesdata.map(CharacterClasseAdapters.fromDriftData).toList();
    return BoardPlayer(
      playerName: dto.data.playerName,
      uuid: dto.data.uuid,
      boardUuid: dto.data.boardUuid,
      characterName: dto.data.characterName,
      brood: Brood.values[dto.data.broodIndex],
      createdAt: dto.data.createdAt,
      updatedAt: dto.data.updatedAt,
      classes: classes,
      imageAsset: dto.data.imageAsset,
      imagePath: dto.data.imagePath,
      life: dto.data.life,
      mana: dto.data.mana,
      defense: dto.data.defense,
      isAlive: dto.data.isAlive,
    );
  }
}
