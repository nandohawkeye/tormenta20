import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_dto.dart';
import 'package:tormenta20/src/shared/entities/board/session_environment.dart';

abstract class BoardSessionAdapters {
  static BoardSessionTableCompanion toCompanion(BoardSession entity) {
    return BoardSessionTableCompanion(
        uuid: Value<String>(entity.uuid),
        boardUuid: Value<String>(entity.boardUuid),
        startedAt: Value<DateTime>(entity.startedAt),
        endAt: Value<DateTime?>(entity.endAt),
        environmentIndex: Value<int?>(entity.environment?.index));
  }

  static BoardSession fromDriftData(BoardSessionTableData data) {
    return BoardSession(
      uuid: data.uuid,
      boardUuid: data.boardUuid,
      startedAt: data.startedAt,
      endAt: data.endAt,
      environment: SessionEnvironment.values[data.environmentIndex ?? 0],
      combats: [],
    );
  }

  static BoardSession fromDto(BoardSessionDto dto) {
    return BoardSession(
      uuid: dto.data.uuid,
      boardUuid: dto.data.boardUuid,
      startedAt: dto.data.startedAt,
      endAt: dto.data.endAt,
      environment: SessionEnvironment.values[dto.data.environmentIndex ?? 0],
      combats: dto.combats.map(BoardCombatAdapters.fromDriftData).toList(),
    );
  }

  static Map<String, dynamic> toJson(BoardSession entity) {
    return {
      'uuid': entity.uuid,
      'board_uuid': entity.boardUuid,
      'started_at': entity.startedAt.toIso8601String(),
      'end_at': entity.endAt?.toIso8601String(),
      'environment_index': entity.environment?.index,
    };
  }

  static BoardSession fromJson(Map<String, dynamic> data) {
    final now = DateTime.now();
    return BoardSession(
      uuid: data['uuid'],
      boardUuid: data['board_uuid'],
      startedAt: DateTime.tryParse(data['started_at']) ?? now,
      endAt: DateTime.tryParse(data['end_at']),
      environment: SessionEnvironment.values[data['environment_index'] ?? 0],
      combats: [],
    );
  }
}
