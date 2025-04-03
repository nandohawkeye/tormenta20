import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board.dart';

abstract class MenaceLinkBoardAdapters {
  static MenaceLinkBoard fromDriftData(MenaceLinkBoardTableData data) {
    return MenaceLinkBoard(
      uuid: data.uuid,
      menaceUuid: data.menaceUuid,
      boardUuid: data.boardUuid,
    );
  }

  static MenaceLinkBoardTableCompanion toDriftCompanion(
      MenaceLinkBoard entity) {
    return MenaceLinkBoardTableCompanion(
      uuid: Value(entity.uuid),
      menaceUuid: Value(entity.menaceUuid),
      boardUuid: Value(entity.boardUuid),
    );
  }

  static Map<String, dynamic> toJson(MenaceLinkBoard entity) {
    return {
      'uuid': entity.uuid,
      'menace_uuid': entity.menaceUuid,
      'board_uuid': entity.boardUuid,
    };
  }

  static MenaceLinkBoard fromJson(Map<String, dynamic> data) {
    return MenaceLinkBoard(
      uuid: data['uuid'],
      menaceUuid: data['menace_uuid'],
      boardUuid: data['board_uuid'],
    );
  }
}
