import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';

abstract class BoardLinkAdapters {
  static BoardLinkTableCompanion toCompanion(BoardLink entity) {
    return BoardLinkTableCompanion(
      uuid: Value<String>(entity.uuid),
      link: Value<String>(entity.link),
      boardUuid: Value<String>(entity.boardUuid),
      title: Value<String>(entity.title),
    );
  }

  static BoardLink fromDriftData(BoardLinkTableData data) {
    return BoardLink(
      uuid: data.uuid,
      link: data.link,
      boardUuid: data.boardUuid,
      title: data.title,
    );
  }
}
