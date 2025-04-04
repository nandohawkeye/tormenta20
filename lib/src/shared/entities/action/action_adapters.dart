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

  static ActionEnt fromJson(Map<String, dynamic> data) {
    return ActionEnt(
      uuid: data['uuid'],
      parentUuid: data['parent_uuid'],
      name: data['name'],
      desc: data['desc'],
      type: ActionType.values[data['type_index']],
      pm: data['pm'],
      cd: data['cd'],
      damageDices: data['damage_dices'],
      extraDamageDices: data['extra_damage_dices'],
      mediumDamageValue: data['medium_damage_value'],
      critical: data['critical'],
      criticalMultiplier: data['critical_multiplier'],
      equipamentUuid: data['equipament_uuid'],
    );
  }

  static Map<String, dynamic> toJson(ActionEnt entity) {
    return {
      'uuid': entity.uuid,
      'parent_uuid': entity.parentUuid,
      'name': entity.name,
      'desc': entity.desc,
      'type_index': entity.type.index,
      'pm': entity.pm,
      'cd': entity.cd,
      'damage_dices': entity.damageDices,
      'extra_damage_dices': entity.extraDamageDices,
      'medium_damage_value': entity.mediumDamageValue,
      'critical': entity.critical,
      'critical_multiplier': entity.criticalMultiplier,
      'equipament_uuid': entity.equipamentUuid,
    };
  }
}
