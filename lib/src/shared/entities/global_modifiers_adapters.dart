import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/global_modifiers.dart';

abstract class GlobalModifiersAdapters {
  static GlobalModifiers fromDriftData(GlobalModifierTableData data) {
    return GlobalModifiers(
      uuid: data.uuid,
      bonusArmor: data.bonusArmor,
      bonusAttack: data.bonusAttack,
      bonusShield: data.bonusShield,
      damage: data.damage,
      defense: data.defense,
      expertises: data.expertises,
      parentUuid: data.parentUuid,
      resistances: data.resistances,
      rool: data.rool,
      others: data.others,
    );
  }

  static GlobalModifierTableCompanion toDriftCompanion(GlobalModifiers entity) {
    return GlobalModifierTableCompanion(
      uuid: Value(entity.uuid),
      bonusArmor: Value(entity.bonusArmor),
      bonusAttack: Value(entity.bonusAttack),
      bonusShield: Value(entity.bonusShield),
      damage: Value(entity.damage),
      defense: Value(entity.defense),
      expertises: Value(entity.expertises),
      parentUuid: Value(entity.parentUuid),
      resistances: Value(entity.resistances),
      rool: Value(entity.rool),
      others: Value(entity.others),
    );
  }

  static GlobalModifiers fromJson(Map<String, dynamic> data) {
    return GlobalModifiers(
      uuid: data['uuid'],
      bonusArmor: data['bonus_armor'],
      bonusAttack: data['bonus_attack'],
      bonusShield: data['bonus_shield'],
      damage: data['damage'],
      defense: data['defense'],
      expertises: data['expertises'],
      parentUuid: data['parent_uuid'],
      resistances: data['resistances'],
      rool: data['rool'],
      others: data['others'],
    );
  }

  static Map<String, dynamic> toJson(GlobalModifiers entity) {
    return {
      'uuid': entity.uuid,
      'bonus_armor': entity.bonusArmor,
      'bonus_attack': entity.bonusAttack,
      'bonus_shield': entity.bonusShield,
      'damage': entity.damage,
      'defense': entity.defense,
      'expertises': entity.expertises,
      'parent_uuid': entity.parentUuid,
      'resistances': entity.resistances,
      'rool': entity.rool,
      'others': entity.others,
    };
  }
}
