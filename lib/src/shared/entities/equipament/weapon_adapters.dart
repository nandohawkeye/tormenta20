import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/Wieldable_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment_weapon_range_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/improvement_type_adapter.dart';
import 'package:tormenta20/src/shared/entities/equipament/special_material_types.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_proficiency.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_purpose.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_skills_adapter.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_type.dart';

abstract class WeaponAdapters {
  static Weapon fromDriftData(WeaponTableData data) {
    final specialMaterial = data.specialMaterialIndex == null
        ? null
        : SpecialMaterialTypes.values[data.specialMaterialIndex!];
    return Weapon(
      uuid: data.uuid,
      spaceOcuped: data.ocupedSpace,
      type: WeaponType.values[data.typeIndex],
      parentUuid: data.parentUuid,
      price: data.price,
      name: data.name,
      desc: data.desc,
      purpose: WeaponPurpose.values[data.purposeIndex],
      critical: data.critical,
      criticalMultiplier: data.criticalMultiplier,
      dices: data.dices,
      isNatural: data.isNatural,
      isUnarmed: data.isUnarmed,
      proficiency: WeaponProficiency.values[data.proficiencyIndex],
      range: EquipmentWeaponRangeType.values[data.rangeIndex],
      skills: WeaponSkillsAdapter.fromString(data.skillIndexes),
      wieldableType: WieldableType.values[data.typeIndex],
      steps: data.steps,
      improvements: ImprovementTypeAdapter.fromString(data.improvements),
      specialMaterial: specialMaterial,
      storedIn: data.storedIn,
    );
  }

  static WeaponTableCompanion toDriftCompanion(Weapon entity) {
    return WeaponTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      price: Value(entity.price),
      desc: Value(entity.desc),
      ocupedSpace: Value(entity.spaceOcuped),
      typeIndex: Value(entity.type.index),
      improvements:
          Value(ImprovementTypeAdapter.toStringValue(entity.improvements)),
      specialMaterialIndex: Value(entity.specialMaterial?.index),
      storedIn: Value(entity.storedIn),
      critical: Value(entity.critical),
      criticalMultiplier: Value(entity.criticalMultiplier),
      dices: Value(entity.dices),
      isNatural: Value(entity.isNatural),
      isUnarmed: Value(entity.isUnarmed),
      proficiencyIndex: Value(entity.proficiency.index),
      purposeIndex: Value(entity.purpose.index),
      rangeIndex: Value(entity.range.index),
      skillIndexes: Value(WeaponSkillsAdapter.toStringValue(entity.skills)),
      steps: Value(entity.steps),
      wieldableIndex: Value(entity.wieldableType.index),
    );
  }

  static Weapon fromJson(Map<String, dynamic> data) {
    SpecialMaterialTypes? specialMaterial;

    if (data['special_material_index'] != null) {
      specialMaterial =
          SpecialMaterialTypes.values[data['special_material_index']];
    }

    return Weapon(
      uuid: data['uuid'],
      parentUuid: data['parent_uuid'],
      price: (data['price'] as double?),
      name: data['name'],
      desc: data['desc'],
      critical: data['critical'],
      criticalMultiplier: data['critical_multiplier'],
      dices: data['dices'],
      spaceOcuped: data['space_ocuped'],
      isNatural: data['is_natural'],
      isUnarmed: data['is_unarmed'],
      type: WeaponType.values[data['type_index']],
      purpose: WeaponPurpose.values[data['purpose_index']],
      proficiency: WeaponProficiency.values[data['proficiency_index']],
      range: EquipmentWeaponRangeType.values[data['range_index']],
      skills: WeaponSkillsAdapter.fromString(data['skill_indexes']),
      steps: data['steps'],
      improvements: ImprovementTypeAdapter.fromString(data['improvements']),
      wieldableType: WieldableType.values[data['wieldable_type_index']],
      specialMaterial: specialMaterial,
    );
  }

  static Map<String, dynamic> toJson(Weapon entity) {
    return {
      'uuid': entity.uuid,
      'parent_uuid': entity.parentUuid,
      'price': entity.price,
      'name': entity.name,
      'desc': entity.desc,
      'critical': entity.critical,
      'critical_multiplier': entity.criticalMultiplier,
      'dices': entity.dices,
      'space_ocuped': entity.spaceOcuped,
      'is_natural': entity.isNatural,
      'is_unarmed': entity.isUnarmed,
      'type_index': entity.type.index,
      'purpose_index': entity.purpose.index,
      'proficiency_index': entity.proficiency.index,
      'range_index': entity.range.index,
      'skill_indexes': WeaponSkillsAdapter.toStringValue(entity.skills),
      'steps': entity.steps,
      'improvements': ImprovementTypeAdapter.toStringValue(entity.improvements),
      'wieldable_type_index': entity.wieldableType.index,
    };
  }
}
