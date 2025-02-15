import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';

abstract class BoardCombatAdapters {
  static BoardCombatTableCompanion toCompanion(BoardCombat entity) {
    return BoardCombatTableCompanion(
      uuid: Value<String>(entity.uuid),
      boardUuid: Value<String>(entity.boardUuid),
      startedAt: Value<DateTime>(entity.startedAt),
      sessionUuid: Value<String>(entity.sessionUuid),
      endAt: Value<DateTime?>(entity.endAt),
      turn: Value<int>(entity.turn),
    );
  }

  static BoardCombat fromDriftData(BoardCombatTableData data) {
    return BoardCombat(
      uuid: data.uuid,
      sessionUuid: data.sessionUuid,
      boardUuid: data.boardUuid,
      startedAt: data.startedAt,
      turn: data.turn,
      endAt: data.endAt,
    );
  }
}
