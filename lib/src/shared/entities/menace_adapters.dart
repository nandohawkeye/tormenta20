import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/action/action_adapters.dart';
import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment_adapters.dart';
import 'package:tormenta20/src/shared/entities/menace_drift_dto.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_adapters.dart';
import 'package:tormenta20/src/shared/entities/general_skill_adapters.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace_adapters.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/entities/menace_type.dart';
import 'package:tormenta20/src/shared/entities/treasure_type.dart';

abstract class MenaceAdapters {
  static Menace fromDriftDto(MenaceDriftDto dto) {
    final treasures = dto.data.treasureTypeIndex == null
        ? null
        : TreasureType.values[dto.data.treasureTypeIndex!];
    return Menace(
      uuid: dto.data.uuid,
      type: MenaceType.values[dto.data.typeIndex],
      name: dto.data.name,
      charisma: dto.data.charisma,
      desc: dto.data.desc,
      combatRole: CombatRole.values[dto.data.combateRoleIndex],
      constitution: dto.data.constitution,
      creatureSize: CreatureSizeCategory.values[dto.data.creatureSizeIndex],
      defense: dto.data.defense,
      dexterity: dto.data.dexterity,
      fortResistence: dto.data.fortResistence,
      initiative: dto.data.initiative,
      intelligence: dto.data.intelligence,
      life: dto.data.life,
      mana: dto.data.mana,
      nd: dto.data.nd,
      wisdom: dto.data.wisdom,
      strength: dto.data.strength,
      perception: dto.data.perception,
      imageAsset: dto.data.imageAsset,
      refResistence: dto.data.refResistence,
      imagePath: dto.data.imagePath,
      extraInfos: dto.data.extraInfos,
      casterInfos: dto.data.casterInfos,
      divinityId: dto.data.divinityId,
      senses: dto.data.senses,
      vonResistence: dto.data.vonResistence,
      treasures: treasures,
      displacement: dto.data.displacement,
      magics: dto.magics.map(MagicMenaceAdapters.fromDriftData).toList(),
      actions: dto.actions.map(ActionAdapters.fromDriftData).toList(),
      equipments: dto.equipments.map(EquipmentAdapters.fromDriftData).toList(),
      expertises: dto.expertises.map(ExpertiseAdapters.fromDriftData).toList(),
      generalSkills:
          dto.generalSkills.map(GeneralSkillAdapters.fromDriftData).toList(),
    );
  }

  static Menace fromDriftData(MenaceTableData data) {
    final treasures = data.treasureTypeIndex == null
        ? null
        : TreasureType.values[data.treasureTypeIndex!];
    return Menace(
      uuid: data.uuid,
      type: MenaceType.values[data.typeIndex],
      name: data.name,
      charisma: data.charisma,
      desc: data.desc,
      combatRole: CombatRole.values[data.combateRoleIndex],
      constitution: data.constitution,
      creatureSize: CreatureSizeCategory.values[data.creatureSizeIndex],
      defense: data.defense,
      dexterity: data.dexterity,
      fortResistence: data.fortResistence,
      initiative: data.initiative,
      intelligence: data.intelligence,
      life: data.life,
      mana: data.mana,
      nd: data.nd,
      wisdom: data.wisdom,
      strength: data.strength,
      perception: data.perception,
      imageAsset: data.imageAsset,
      refResistence: data.refResistence,
      imagePath: data.imagePath,
      extraInfos: data.extraInfos,
      casterInfos: data.casterInfos,
      divinityId: data.divinityId,
      senses: data.senses,
      vonResistence: data.vonResistence,
      treasures: treasures,
      displacement: data.displacement,
      magics: [],
      actions: [],
      equipments: [],
      expertises: [],
      generalSkills: [],
    );
  }

  static MenaceTableCompanion toDriftCompanion(Menace entity) {
    return MenaceTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      desc: Value(entity.desc),
      typeIndex: Value(entity.type.index),
      casterInfos: Value(entity.casterInfos),
      charisma: Value(entity.charisma),
      combateRoleIndex: Value(entity.combatRole.index),
      constitution: Value(entity.constitution),
      creatureSizeIndex: Value(entity.creatureSize.index),
      defense: Value(entity.defense),
      dexterity: Value(entity.dexterity),
      displacement: Value(entity.displacement),
      divinityId: Value(entity.divinityId),
      extraInfos: Value(entity.extraInfos),
      fortResistence: Value(entity.fortResistence),
      imageAsset: Value(entity.imageAsset),
      imagePath: Value(entity.imagePath),
      initiative: Value(entity.initiative),
      intelligence: Value(entity.intelligence),
      life: Value(entity.life),
      mana: Value(entity.mana),
      nd: Value(entity.nd),
      perception: Value(entity.perception),
      refResistence: Value(entity.refResistence),
      senses: Value(entity.senses),
      strength: Value(entity.strength),
      treasureTypeIndex: Value(entity.treasures?.index),
      vonResistence: Value(entity.vonResistence),
      wisdom: Value(entity.wisdom),
    );
  }
}
