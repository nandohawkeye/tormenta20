import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag.dart';

abstract class SaddlebagAdapters {
  static Saddlebag fromDriftData(SaddlebagTableData data) {
    return Saddlebag(
      uuid: data.uuid,
      parentUuid: data.parentUuid,
      price: data.price,
    );
  }

  static SaddlebagTableCompanion toDriftCompanion(Saddlebag entity) {
    return SaddlebagTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      price: Value(entity.price),
    );
  }

  static Saddlebag fromJson(Map<String, dynamic> data) {
    return Saddlebag(
      uuid: data['uuid'],
      parentUuid: data['parent_uuid'],
      price: (data['price'] as double?),
    );
  }

  static Map<String, dynamic> toJson(Saddlebag entity) {
    return {
      'uuid': entity.uuid,
      'parent_uuid': entity.parentUuid,
      'price': entity.price,
    };
  }
}
