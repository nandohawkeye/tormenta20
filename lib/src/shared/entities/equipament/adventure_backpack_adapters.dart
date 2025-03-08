import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventurer_backpack.dart';

abstract class AdventureBackpackAdapters {
  static AdventureBackpack fromDriftData(AdventureBackpackTableData data) {
    return AdventureBackpack(
      uuid: data.uuid,
      parentUuid: data.parentUuid,
      price: data.price,
    );
  }

  static AdventureBackpackTableCompanion toDriftCompanion(
      AdventureBackpack entity) {
    return AdventureBackpackTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      suffix: Value(entity.suffix),
      price: Value(entity.price),
    );
  }
}
