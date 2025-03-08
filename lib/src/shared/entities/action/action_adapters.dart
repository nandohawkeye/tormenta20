import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_type.dart';

abstract class ActionAdapters {
  static ActionEnt fromDriftData(ActionTableData data) {
    return ActionEnt(
      uuid: data.uuid,
      parentUuid: data.parentUuid,
      name: data.name,
      desc: data.desc,
      type: ActionType.values[data.typeIndex],
      pm: data.pm,
      cd: data.cd,
      damageDices: data.damageDices,
      extraDamageDices: data.extraDamageDices,
      mediumDamageValue: data.mediumDamageValue,
      critical: data.critical,
      criticalMultiplier: data.criticalMultiplier,
      equipamentUuid: data.equipamentUuid,
    );
  }

  static ActionTableCompanion toDriftCompanion(ActionEnt entity) {
    return ActionTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      desc: Value(entity.desc),
      damageDices: Value(entity.damageDices),
      extraDamageDices: Value(entity.extraDamageDices),
      pm: Value(entity.pm),
      cd: Value(entity.cd),
      equipamentUuid: Value(entity.equipamentUuid),
      mediumDamageValue: Value(entity.mediumDamageValue),
      critical: Value(entity.critical),
      criticalMultiplier: Value(entity.criticalMultiplier),
      typeIndex: Value(entity.type.index),
    );
  }
}
