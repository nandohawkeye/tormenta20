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

  static Map<String, dynamic> toJson(BoardCombat entity) {
    return {
      'uuid': entity.uuid,
      'board_uuid': entity.boardUuid,
      'session_uuid': entity.sessionUuid,
      'turn': entity.turn,
      'started_at': entity.startedAt.toIso8601String(),
      'end_at': entity.endAt?.toIso8601String(),
    };
  }

  static BoardCombat fromJson(Map<String, dynamic> data) {
    final now = DateTime.now();
    return BoardCombat(
      uuid: data['uuid'],
      sessionUuid: data['session_uuid'],
      boardUuid: data['board_uuid'],
      startedAt: DateTime.tryParse(data['started_at']) ?? now,
      turn: data['turn'],
      endAt: DateTime.tryParse(data['end_at']),
    );
  }
}
