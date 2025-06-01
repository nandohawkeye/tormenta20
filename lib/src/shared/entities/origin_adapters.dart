import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';

abstract class OriginAdapters {
  static Origin fromDriftData(OriginTableData data) {
    return Origin(
      uuid: data.uuid,
      name: data.name,
      desc: data.desc,
      characterUuid: data.characterUuid,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  static OriginTableCompanion toDriftCompanion(Origin entity) {
    return OriginTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      desc: Value(entity.desc),
      createdAt: Value(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
      characterUuid: Value(entity.characterUuid),
    );
  }

  static Origin fromJson(Map<String, dynamic> data) {
    return Origin(
      uuid: data['uuid'],
      name: data['name'],
      desc: data['desc'],
      characterUuid: data['character_uuid'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data['updated_at']),
    );
  }

  static Map<String, dynamic> toJson(Origin entity) {
    return {
      'uuid': entity.uuid,
      'name': entity.name,
      'desc': entity.desc,
      'character_uuid': entity.characterUuid,
      'created_at': entity.createdAt.millisecondsSinceEpoch,
      'updated_at': entity.updatedAt.millisecondsSinceEpoch,
    };
  }
}
