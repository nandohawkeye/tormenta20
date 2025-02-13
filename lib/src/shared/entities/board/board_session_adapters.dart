import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_dto.dart';

abstract class BoardSessionAdapters {
  static BoardSessionTableCompanion toCompanion(BoardSession entity) {
    return BoardSessionTableCompanion(
      uuid: Value<String>(entity.uuid),
      boardUuid: Value<String>(entity.boardUuid),
      startedAt: Value<DateTime>(entity.startedAt),
      endAt: Value<DateTime?>(entity.endAt),
    );
  }

  static BoardSession fromDriftData(BoardSessionTableData data) {
    return BoardSession(
      uuid: data.uuid,
      boardUuid: data.boardUuid,
      startedAt: data.startedAt,
      endAt: data.endAt,
      combats: [],
    );
  }

  static BoardSession fromDto(BoardSessionDto dto) {
    return BoardSession(
      uuid: dto.data.uuid,
      boardUuid: dto.data.boardUuid,
      startedAt: dto.data.startedAt,
      endAt: dto.data.endAt,
      combats: dto.combats.map(BoardCombatAdapters.fromDriftData).toList(),
    );
  }
}
