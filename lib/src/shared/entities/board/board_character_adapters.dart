import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_charcter.dart';

abstract class BoardCharacterAdapters {
  static BoardCharacterTableCompanion toCompanion(BoardCharacter entity) {
    return BoardCharacterTableCompanion(
      uuid: Value<String>(entity.uuid),
      boardUuid: Value<String>(entity.boardUuid),
      characterName: Value<String>(entity.characterName),
      playerName: Value<String>(entity.playerName),
      imagePath: Value<String?>(entity.imagePath),
      imageAsset: Value<String?>(entity.imageAsset),
      broodIndex: Value<int>(entity.brood.index),
      createdAt: Value<int>(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value<int>(entity.updatedAt.millisecondsSinceEpoch),
    );
  }
}
