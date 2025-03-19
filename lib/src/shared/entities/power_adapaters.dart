import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/entities/power_type.dart';

abstract class PowerAdapaters {
  static Power fromDriftData(PowerTableData data) {
    return Power(
      uuid: data.uuid,
      name: data.name,
      desc: data.desc,
      type: PowerType.values[data.typeIndex],
      characterUuid: data.characterUuid,
    );
  }

  static PowerTableCompanion toDriftCompanion(Power entity) {
    return PowerTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      desc: Value(entity.desc),
      typeIndex: Value(entity.type.index),
      characterUuid: Value(entity.characterUuid),
    );
  }
}
