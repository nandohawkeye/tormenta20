import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';

abstract class BoardNoteAdapters {
  static BoardNote fromDriftData(BoardNoteTableData data) {
    return BoardNote(
      uuid: data.uuid,
      note: data.note,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
      boardUuid: data.boardUuid,
      isFavorited: data.isFavorited,
    );
  }

  static BoardNoteTableCompanion toCompanion(BoardNote entity) {
    return BoardNoteTableCompanion(
      uuid: Value<String>(entity.uuid),
      boardUuid: Value<String>(entity.boardUuid),
      note: Value<String>(entity.note),
      isFavorited: Value<bool>(entity.isFavorited),
      createdAt: Value<int>(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value<int>(entity.updatedAt.millisecondsSinceEpoch),
    );
  }

  static Map<String, dynamic> toJson(BoardNote entity) {
    return {
      'uuid': entity.uuid,
      'note': entity.note,
      'created_at': entity.createdAt.toIso8601String(),
      'updated_at': entity.updatedAt.toIso8601String(),
      'board_uuid': entity.boardUuid,
      'is_favorited': entity.isFavorited,
    };
  }

  static BoardNote fromJson(Map<String, dynamic> data) {
    final now = DateTime.now();
    return BoardNote(
      uuid: data['uuid'],
      note: data['note'],
      createdAt: DateTime.tryParse(data['created_at'] ?? '') ?? now,
      updatedAt: DateTime.tryParse(data['updated_at'] ?? '') ?? now,
      boardUuid: data['board_uuid'],
      isFavorited: data['is_favorited'],
    );
  }
}
