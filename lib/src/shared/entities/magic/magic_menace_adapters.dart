import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';

class MagicMenaceAdapters {
  static MagicMenace fromDriftData(MagicMenaceTableData data) {
    return MagicMenace(
      name: data.name,
      uuid: data.uuid,
      menaceUuid: data.menaceUuid,
      resumedDesc: data.resumedDesc,
      magicBaseId: data.magicBaseId,
      pm: data.pm,
      cd: data.cd,
      damageDices: data.damageDices,
      mediumDamageValue: data.mediumDamageValue,
      extraDamageDices: data.extraDamageDices,
    );
  }

  static MagicMenace fromJson(Map<String, dynamic> data) {
    return MagicMenace(
      uuid: data['uuid'] as String,
      name: data['name'] as String,
      resumedDesc: data['resumed_desc'] as String,
      menaceUuid: data['menace_uuid'] as String,
      magicBaseId: data['magic_base_id'] as int,
      pm: data['pm'] as int,
      cd: data['cd'] as int,
      damageDices: data['damage_dices'],
      mediumDamageValue: data['medium_damage_value'] as int,
      extraDamageDices: data['extra_damage_dices'],
    );
  }

  static Map<String, dynamic> toJson(MagicMenace entity) {
    return {
      'uuid': entity.uuid,
      'name': entity.name,
      'resumed_desc': entity.resumedDesc,
      'menace_uuid': entity.menaceUuid,
      'magic_base_id': entity.magicBaseId,
      'pm': entity.pm,
      'cd': entity.cd,
      'damage_dices': entity.damageDices,
      'medium_damage_value': entity.mediumDamageValue,
      'extra_damage_dices': entity.extraDamageDices,
    };
  }

  static MagicMenaceTableCompanion toDriftCompanion(MagicMenace entity) {
    return MagicMenaceTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      resumedDesc: Value(entity.resumedDesc),
      menaceUuid: Value(entity.menaceUuid),
      magicBaseId: Value(entity.magicBaseId),
      pm: Value(entity.pm),
      cd: Value(entity.cd),
      mediumDamageValue: Value(entity.mediumDamageValue),
      damageDices: Value(entity.damageDices),
      extraDamageDices: Value(entity.extraDamageDices),
    );
  }
}
