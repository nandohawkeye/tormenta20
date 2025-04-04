import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';

abstract class BackpackAdapters {
  static Backpack fromDriftData(BackpackTableData data) {
    return Backpack(
      uuid: data.uuid,
      parentUuid: data.parentUuid,
      price: data.price,
    );
  }

  static BackpackTableCompanion toDriftCompanion(Backpack entity) {
    return BackpackTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      suffix: Value(entity.suffix),
      price: Value(entity.price),
    );
  }

  static Backpack fromJson(Map<String, dynamic> data) {
    return Backpack(
      uuid: data['uuid'],
      parentUuid: data['parent_uuid'],
      price: (data['price'] as double?),
    );
  }

  static Map<String, dynamic> toJson(Backpack entity) {
    return {
      'uuid': entity.uuid,
      'parent_uuid': entity.parentUuid,
      'price': entity.price,
    };
  }
}
