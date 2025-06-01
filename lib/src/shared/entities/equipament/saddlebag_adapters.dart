import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag.dart';

abstract class SaddlebagAdapters {
  static Saddlebag fromDriftData(SaddlebagTableData data) {
    return Saddlebag(
      uuid: data.uuid,
      parentUuid: data.parentUuid,
      price: data.price,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  static SaddlebagTableCompanion toDriftCompanion(Saddlebag entity) {
    return SaddlebagTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      price: Value(entity.price),
      createdAt: Value(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
    );
  }

  static Saddlebag fromJson(Map<String, dynamic> data) {
    return Saddlebag(
      uuid: data['uuid'],
      parentUuid: data['parent_uuid'],
      price: (data['price'] as double?),
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data['updated_at']),
    );
  }

  static Map<String, dynamic> toJson(Saddlebag entity) {
    return {
      'uuid': entity.uuid,
      'parent_uuid': entity.parentUuid,
      'price': entity.price,
      'created_at': entity.createdAt.millisecondsSinceEpoch,
      'updated_at': entity.updatedAt.millisecondsSinceEpoch,
    };
  }
}
