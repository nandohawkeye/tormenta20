import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circles.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_duration.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_execution.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';
import 'package:uuid/uuid.dart';

abstract class MagicCharacterAdapters {
  static MagicCharacter createFromMagic(Magic magic, String grimorieUuid) {
    return MagicCharacter(
      uuid: const Uuid().v4(),
      grimoireUuid: grimorieUuid,
      id: magic.id,
      name: magic.name,
      desc: magic.desc,
      circle: magic.circle,
      type: magic.type,
      school: magic.school,
      execution: magic.execution,
      duration: magic.duration,
      range: magic.range,
      resistence: magic.resistence,
      targetAreaEffect: magic.targetAreaEffect,
      publication: magic.publication,
    );
  }

  static MagicCharacter fromDriftData(MagicCharacterTableData data) {
    return MagicCharacter(
      uuid: data.uuid,
      grimoireUuid: data.grimoireUUid,
      id: data.magicId,
      name: data.name,
      desc: data.desc,
      circle: magicCircleFromLevel(data.circleLevel),
      type: MagicType.values[data.typeIndex],
      school: MagicSchool.values[data.schoolIndex],
      execution: MagicExecution.values[data.executionIndex],
      duration: MagicDuration.values[data.durationIndex],
      range: MagicRange.values[data.rangeIndex],
      resistence: data.resistence,
      targetAreaEffect: data.targetAreaEfect,
      publication: data.publication,
      pm: data.pm,
      cd: data.cd,
      damageDices: data.damageDices,
      extraDamageDices: data.extraDamageDices,
      mediumDamageValue: data.mediumDamageValue,
    );
  }

  static MagicCharacter fromJson(Map<String, dynamic> data) {
    return MagicCharacter(
      uuid: data['uuid'],
      grimoireUuid: data['grimoire_uuid'],
      id: data['magic_id'],
      name: data['name'],
      desc: data['desc'],
      circle: magicCircleFromLevel(data['circle_level']),
      type: MagicType.values[data['type_index']],
      school: MagicSchool.values[data['school_index']],
      execution: MagicExecution.values[data['execution_index']],
      duration: MagicDuration.values[data['duration_index']],
      range: MagicRange.values[data['range_index']],
      resistence: data['resistence'],
      targetAreaEffect: data['target_area_effect'],
      publication: data['publication'],
      pm: data['pm'],
      cd: data['cd'],
      damageDices: data['damage_dices'],
      extraDamageDices: data['extra_damage_dices'],
      mediumDamageValue: data['medium_damage_value'],
    );
  }

  static Map<String, dynamic> toJson(MagicCharacter entity) {
    return {
      'uuid': entity.uuid,
      'grimoire_uuid': entity.grimoireUuid,
      'magic_id': entity.id,
      'name': entity.name,
      'desc': entity.desc,
      'circle_level': entity.circle.level,
      'type_index': entity.type.index,
      'school_index': entity.school.index,
      'execution_index': entity.execution.index,
      'duration_index': entity.duration.index,
      'range_index': entity.range.index,
      'resistence': entity.resistence,
      'target_area_effect': entity.targetAreaEffect,
      'publication': entity.publication,
      'pm': entity.pm,
      'cd': entity.cd,
      'damage_dices': entity.damageDices,
      'extra_damage_dices': entity.extraDamageDices,
      'medium_damage_value': entity.mediumDamageValue,
    };
  }

  static MagicCharacterTableCompanion toCompanion(MagicCharacter entity) {
    return MagicCharacterTableCompanion(
      magicId: Value<int>(entity.id),
      uuid: Value<String>(entity.uuid),
      grimoireUUid: Value<String>(entity.grimoireUuid),
      name: Value<String>(entity.name),
      desc: Value<String>(entity.desc),
      circleLevel: Value<int>(entity.circle.level),
      typeIndex: Value<int>(entity.type.index),
      schoolIndex: Value<int>(entity.school.index),
      executionIndex: Value<int>(entity.execution.index),
      durationIndex: Value<int>(entity.duration.index),
      rangeIndex: Value<int>(entity.range.index),
      resistence: Value<String>(entity.resistence),
      targetAreaEfect: Value<String>(entity.targetAreaEffect),
      publication: Value<String>(entity.publication),
      pm: Value<int?>(entity.pm),
      cd: Value<int?>(entity.cd),
      damageDices: Value<String?>(entity.damageDices),
      extraDamageDices: Value<String?>(entity.extraDamageDices),
      mediumDamageValue: Value<int?>(entity.mediumDamageValue),
    );
  }
}
