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
}
