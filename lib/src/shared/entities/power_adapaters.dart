import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/entities/power_type.dart';

abstract class PowerAdapters {
  static Power fromDriftData(PowerTableData data) {
    return Power(
      uuid: data.uuid,
      name: data.name,
      desc: data.desc,
      type: PowerType.values[data.typeIndex],
      characterUuid: data.characterUuid,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  static PowerTableCompanion toDriftCompanion(Power entity) {
    return PowerTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      desc: Value(entity.desc),
      typeIndex: Value(entity.type.index),
      characterUuid: Value(entity.characterUuid),
      createdAt: Value(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
    );
  }

  static Power fromJson(Map<String, dynamic> data) {
    return Power(
      uuid: data['uuid'],
      name: data['name'],
      desc: data['desc'],
      type: PowerType.values[data['type_index']],
      characterUuid: data['character_uuid'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data['updated_at']),
    );
  }

  static Map<String, dynamic> toJson(Power entity) {
    return {
      'uuid': entity.uuid,
      'name': entity.name,
      'desc': entity.desc,
      'type_index': entity.type.index,
      'character_uuid': entity.characterUuid,
      'created_at': entity.createdAt.millisecondsSinceEpoch,
      'updated_at': entity.updatedAt.millisecondsSinceEpoch,
    };
  }
}
