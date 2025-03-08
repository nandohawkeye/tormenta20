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
}
