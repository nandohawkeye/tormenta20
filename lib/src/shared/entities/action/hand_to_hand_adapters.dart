import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';

abstract class HandToHandAdapters {
  static HandToHand fromDriftData(ActionHandToHandTableData data) {
    return HandToHand(
      uuid: data.uuid,
      parentUuid: data.parentUuid,
      name: data.name,
      desc: data.desc,
      pm: data.pm,
      cd: data.cd,
      damageDices: data.damageDices,
      extraDamageDices: data.extraDamageDices,
      mediumDamageValue: data.mediumDamageValue,
      critical: data.critical,
      criticalMultiplier: data.criticalMultiplier,
      equipamentUuid: data.equipamentUuid,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  static ActionHandToHandTableCompanion toDriftCompanion(HandToHand entity) {
    return ActionHandToHandTableCompanion(
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
      createdAt: Value(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
    );
  }

  static HandToHand fromJson(Map<String, dynamic> data) {
    return HandToHand(
      uuid: data['uuid'],
      parentUuid: data['parent_uuid'],
      name: data['name'],
      desc: data['desc'],
      pm: data['pm'],
      cd: data['cd'],
      damageDices: data['damage_dices'],
      extraDamageDices: data['extra_damage_dices'],
      mediumDamageValue: data['medium_damage_value'],
      critical: data['critical'],
      criticalMultiplier: data['critical_multiplier'],
      equipamentUuid: data['equipament_uuid'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data['updated_at']),
    );
  }

  static Map<String, dynamic> toJson(HandToHand entity) {
    return {
      'uuid': entity.uuid,
      'parent_uuid': entity.parentUuid,
      'name': entity.name,
      'desc': entity.desc,
      'pm': entity.pm,
      'cd': entity.cd,
      'damage_dices': entity.damageDices,
      'extra_damage_dices': entity.extraDamageDices,
      'medium_damage_value': entity.mediumDamageValue,
      'critical': entity.critical,
      'critical_multiplier': entity.criticalMultiplier,
      'equipament_uuid': entity.equipamentUuid,
      'created_at': entity.createdAt.millisecondsSinceEpoch,
      'updated_at': entity.updatedAt.millisecondsSinceEpoch,
    };
  }
}
