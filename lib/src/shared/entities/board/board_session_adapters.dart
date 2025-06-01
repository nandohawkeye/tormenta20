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
      startedAt: Value(entity.startedAt.millisecondsSinceEpoch),
      endAt: Value(entity.endAt?.millisecondsSinceEpoch),
      environmentIndex: Value<int?>(entity.environment?.index),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
    );
  }

  static BoardSession fromDriftData(BoardSessionTableData data) {
    return BoardSession(
      uuid: data.uuid,
      boardUuid: data.boardUuid,
      startedAt: DateTime.fromMillisecondsSinceEpoch(data.startedAt),
      endAt: data.endAt == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(data.endAt!),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
      environment: SessionEnvironment.values[data.environmentIndex ?? 0],
      combats: [],
    );
  }

  static BoardSession fromDto(BoardSessionDto dto) {
    return BoardSession(
      uuid: dto.data.uuid,
      boardUuid: dto.data.boardUuid,
      startedAt: DateTime.fromMillisecondsSinceEpoch(dto.data.startedAt),
      endAt: dto.data.endAt == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(dto.data.endAt!),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(dto.data.updatedAt),
      environment: SessionEnvironment.values[dto.data.environmentIndex ?? 0],
      combats: dto.combats.map(BoardCombatAdapters.fromDriftData).toList(),
    );
  }

  static Map<String, dynamic> toJson(BoardSession entity) {
    return {
      'uuid': entity.uuid,
      'board_uuid': entity.boardUuid,
      'started_at': entity.startedAt.millisecondsSinceEpoch,
      'end_at': entity.endAt?.millisecondsSinceEpoch,
      'environment_index': entity.environment?.index,
      'updated_at': entity.updatedAt.millisecondsSinceEpoch
    };
  }

  static BoardSession fromJson(Map<String, dynamic> data) {
    final now = DateTime.now();
    return BoardSession(
      uuid: data['uuid'],
      boardUuid: data['board_uuid'],
      startedAt: data['started_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(data['started_at'])
          : now,
      endAt: data['end_at'] == null ? null : DateTime.tryParse(data['end_at']),
      environment: SessionEnvironment.values[data['environment_index'] ?? 0],
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data['updated_at']),
      combats: [],
    );
  }
}
