import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/distance_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand_adapters.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/entities/character_alignment_type.dart';
import 'package:tormenta20/src/shared/entities/character_board_adapters.dart';
import 'package:tormenta20/src/shared/entities/character_dto.dart';
import 'package:tormenta20/src/shared/entities/classe_character_type_adapters.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventure_backpack_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_adapters.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire_adapters.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/entities/origin_adapters.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/entities/power_adapaters.dart';
import 'package:tormenta20/src/shared/entities/trained_expertise_adapters.dart';

abstract class CharacterAdapters {
  static Character fromDriftDto(CharacterDto dto) {
    List<Origin> origins = [];
    origins.addAll(dto.origins.map(OriginAdapters.fromDriftData));
    List<Power> powers = [];
    powers.addAll(dto.powers.map(PowerAdapters.fromDriftData));
    List<ActionEnt> actions = [];
    actions.addAll(dto.actions.map(ActionAdapters.fromDriftData));
    actions
        .addAll(dto.distanceAttacks.map(DistanceAttackAdapters.fromDriftData));
    actions.addAll(dto.handToHands.map(HandToHandAdapters.fromDriftData));

    List<Equipment> equipments = [];
    equipments.addAll(dto.equipments.map(EquipmentAdapters.fromDriftData));
    equipments.addAll(
        dto.adventureBackpacks.map(AdventureBackpackAdapters.fromDriftData));
    equipments.addAll(dto.backpacks.map(BackpackAdapters.fromDriftData));
    equipments.addAll(dto.ammunitions.map(AmmunitionAdapters.fromDriftData));
    equipments.addAll(dto.armors.map(ArmorAdapters.fromDriftData));
    equipments.addAll(dto.generalItens.map(GeneralItemAdapters.fromDriftData));
    equipments.addAll(dto.saddlebags.map(SaddlebagAdapters.fromDriftData));
    equipments.addAll(dto.shields.map(ShieldAdapters.fromDriftData));
    equipments.addAll(dto.weapons.map(WeaponAdapters.fromDriftData));
    return Character(
      uuid: dto.data.uuid,
      alignmentType: CharacterAlignmentType.values[dto.data.aligmentIndex],
      brood: Brood.values[dto.data.broodIndex],
      createdAt: DateTime.fromMillisecondsSinceEpoch(dto.data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(dto.data.updatedAt),
      creatureSize: CreatureSizeCategory.values[dto.data.creatureSizeIndex],
      defense: dto.data.defense,
      life: dto.data.life,
      mana: dto.data.mana,
      name: dto.data.name,
      charisma: dto.data.charisma,
      constitution: dto.data.constitution,
      dexterity: dto.data.dexterity,
      displacement: dto.data.displacement,
      divinityId: dto.data.divinityId,
      imageAsset: dto.data.imageAsset,
      imagePath: dto.data.imagePath,
      intelligence: dto.data.intelligence,
      perception: dto.data.perception,
      senses: dto.data.senses,
      strength: dto.data.strength,
      wisdom: dto.data.wisdom,
      characterBoards: dto.characterBoardsData
          .map(CharacterBoardAdapters.fromDriftData)
          .toList(),
      trainedExpertises: TrainedExpertiseAdapters.fromString(
          dto.data.trainedExpertisesIndexes),
      grimorie: dto.grimoireData == null
          ? null
          : GrimoireAdapters.fromDriftData(dto.grimoireData!),
      classe: ClasseCharacterTypeAdapters.fromDriftData(dto.classe),
      powers: powers,
      origins: origins,
      equipments: equipments,
      actions: actions,
    );
  }

  static Character fromDriftData(CharacterTableData data) {
    return Character(
      uuid: data.uuid,
      alignmentType: CharacterAlignmentType.values[data.aligmentIndex],
      brood: Brood.values[data.broodIndex],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
      creatureSize: CreatureSizeCategory.values[data.creatureSizeIndex],
      defense: data.defense,
      life: data.life,
      mana: data.mana,
      name: data.name,
      charisma: data.charisma,
      constitution: data.constitution,
      dexterity: data.dexterity,
      displacement: data.displacement,
      divinityId: data.divinityId,
      imageAsset: data.imageAsset,
      imagePath: data.imagePath,
      intelligence: data.intelligence,
      perception: data.perception,
      senses: data.senses,
      strength: data.strength,
      wisdom: data.wisdom,
      characterBoards: [],
      trainedExpertises:
          TrainedExpertiseAdapters.fromString(data.trainedExpertisesIndexes),
      grimorie: null,
      classe: null,
      powers: [],
      origins: [],
      equipments: [],
      actions: [],
    );
  }

  static Character fromJson(Map<String, dynamic> data) {
    final now = DateTime.now();
    return Character(
      uuid: data['uuid'],
      alignmentType: CharacterAlignmentType.values[data['aligment_index']],
      brood: Brood.values[data['brood_index']],
      createdAt: DateTime.tryParse(data['created_at']) ?? now,
      updatedAt: DateTime.tryParse(data['updated_at']) ?? now,
      creatureSize: CreatureSizeCategory.values[data['creature_size_index']],
      defense: data['defense'],
      life: data['life'],
      mana: data['mana'],
      name: data['name'],
      charisma: data['charisma'],
      constitution: data['constitution'],
      dexterity: data['dexterity'],
      displacement: data['displacement'],
      divinityId: data['divinity_id'],
      imageAsset: data['image_asset'],
      imagePath: null,
      intelligence: data['intelligence'],
      perception: data['perception'],
      senses: data['senses'],
      strength: data['strength'],
      wisdom: data['wisdom'],
      characterBoards: [],
      trainedExpertises: TrainedExpertiseAdapters.fromString(
          data['trained_expertises_indexes']),
      grimorie: null,
      classe: null,
      powers: [],
      origins: [],
      equipments: [],
      actions: [],
    );
  }

  static CharacterTableCompanion toDriftCompanion(Character entity) {
    return CharacterTableCompanion(
      uuid: Value(entity.uuid),
      aligmentIndex: Value(entity.alignmentType.index),
      broodIndex: Value(entity.brood.index),
      charisma: Value(entity.charisma ?? 0),
      constitution: Value(entity.constitution ?? 0),
      createdAt: Value(entity.createdAt.millisecondsSinceEpoch),
      creatureSizeIndex: Value(entity.creatureSize.index),
      defense: Value(entity.defense),
      dexterity: Value(entity.dexterity ?? 0),
      displacement: Value(entity.displacement),
      divinityId: Value(entity.divinityId),
      grimoireUuid: Value(entity.grimorie?.uuid),
      imageAsset: Value(entity.imageAsset),
      imagePath: Value(entity.imagePath),
      intelligence: Value(entity.intelligence ?? 0),
      life: Value(entity.life),
      mana: Value(entity.mana),
      name: Value(entity.name),
      perception: Value(entity.perception ?? 0),
      senses: Value(entity.senses),
      strength: Value(entity.strength ?? 0),
      trainedExpertisesIndexes: Value(
          TrainedExpertiseAdapters.toStringValue(entity.trainedExpertises)),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
      wisdom: Value(entity.wisdom ?? 0),
    );
  }
}
