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
      createdAt: Value<int>(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value<int>(entity.updatedAt.millisecondsSinceEpoch),
    );
  }

  static BoardLink fromDriftData(BoardLinkTableData data) {
    return BoardLink(
      uuid: data.uuid,
      link: data.link,
      boardUuid: data.boardUuid,
      title: data.title,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  static Map<String, dynamic> toJson(BoardLink entity) {
    return {
      'uuid': entity.uuid,
      'title': entity.title,
      'link': entity.link,
      'board_uuid': entity.boardUuid,
      'created_at': entity.createdAt.millisecondsSinceEpoch,
      'updated_at': entity.updatedAt.millisecondsSinceEpoch,
    };
  }

  static BoardLink fromJson(Map<String, dynamic> data, String boardUuid) {
    return BoardLink(
      uuid: data['uuid'],
      link: data['link'],
      boardUuid: boardUuid,
      title: data['title'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data['updated_at']),
    );
  }
}
