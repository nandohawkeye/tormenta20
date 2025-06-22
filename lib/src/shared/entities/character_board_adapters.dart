import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand_adapters.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/entities/character_alignment_type.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/entities/character_board_dto.dart';
import 'package:tormenta20/src/shared/entities/character_conditions.dart';
import 'package:tormenta20/src/shared/entities/character_conditions_adapters.dart';
import 'package:tormenta20/src/shared/entities/classe_character_type_adapters.dart';
import 'package:tormenta20/src/shared/entities/classe_type_character.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventure_backpack_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventurere_backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/tibars.dart';
import 'package:tormenta20/src/shared/entities/equipament/tibars_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_adapters.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_adapters.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/entities/global_modifiers.dart';
import 'package:tormenta20/src/shared/entities/global_modifiers_adapters.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire_adapters.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/entities/origin_adapters.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/entities/power_adapaters.dart';
import 'package:tormenta20/src/shared/services/expertises_base_service.dart';
import 'package:uuid/uuid.dart';

abstract class CharacterBoardAdapters {
  static CharacterBoard fromDriftDto(CharacterBoardDto dto) {
    List<Origin> origins = [];
    origins.addAll(dto.origins.map(OriginAdapters.fromDriftData));
    List<Power> powers = [];
    powers.addAll(dto.powers.map(PowerAdapters.fromDriftData));
    List<ActionEnt> actions = [];
    actions.addAll(dto.actions.map(ActionAdapters.fromDriftData));
    actions.addAll(
      dto.distanceAttacks.map(DistanceAttackAdapters.fromDriftData),
    );
    actions.addAll(dto.handToHands.map(HandToHandAdapters.fromDriftData));

    List<ClasseTypeCharacter> classes = [];
    classes.addAll(dto.classes.map(ClasseCharacterTypeAdapters.fromDriftData));

    List<Expertise> expertises = [];
    expertises.addAll(dto.expertises.map(ExpertiseAdapters.fromDriftData));

    List<CharacterConditions> conditions = [];
    conditions.addAll(
      dto.conditions.map(CharacterConditionsAdapters.fromDriftData),
    );

    List<Equipment> equipments = [];
    equipments.addAll(dto.equipments.map(EquipmentAdapters.fromDriftData));
    equipments.addAll(
      dto.adventureBackpacks.map(AdventureBackpackAdapters.fromDriftData),
    );
    equipments.addAll(dto.backpacks.map(BackpackAdapters.fromDriftData));
    equipments.addAll(dto.ammunitions.map(AmmunitionAdapters.fromDriftData));
    equipments.addAll(dto.armors.map(ArmorAdapters.fromDriftData));
    equipments.addAll(dto.generalItens.map(GeneralItemAdapters.fromDriftData));
    equipments.addAll(dto.saddlebags.map(SaddlebagAdapters.fromDriftData));
    equipments.addAll(dto.shields.map(ShieldAdapters.fromDriftData));
    equipments.addAll(dto.weapons.map(WeaponAdapters.fromDriftData));

    if (dto.tibars != null) {
      equipments.add(TibarsAdapters.fromDriftData(dto.tibars!));
    }

    return CharacterBoard(
      uuid: dto.characterBoardsData.uuid,
      parentuuid: dto.characterBoardsData.parentuuid,
      boardUuid: dto.characterBoardsData.boarduuid,
      isAlive: dto.characterBoardsData.isAlive,
      currentLife: dto.characterBoardsData.currentLife,
      currentMana: dto.characterBoardsData.currentMana,
      alignmentType:
          CharacterAlignmentType.values[dto.characterBoardsData.aligmentIndex],
      brood: Brood.values[dto.characterBoardsData.broodIndex],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        dto.characterBoardsData.createdAt,
      ),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        dto.characterBoardsData.updatedAt,
      ),
      creatureSize: CreatureSizeCategory
          .values[dto.characterBoardsData.creatureSizeIndex],
      defense: dto.characterBoardsData.defense,
      life: dto.characterBoardsData.life,
      mana: dto.characterBoardsData.mana,
      name: dto.characterBoardsData.name,
      charisma: dto.characterBoardsData.charisma,
      constitution: dto.characterBoardsData.constitution,
      dexterity: dto.characterBoardsData.dexterity,
      displacement: dto.characterBoardsData.displacement,
      divinityId: dto.characterBoardsData.divinityId,
      imageAsset: dto.characterBoardsData.imageAsset,
      imagePath: dto.characterBoardsData.imagePath,
      intelligence: dto.characterBoardsData.intelligence,
      senses: dto.characterBoardsData.senses,
      strength: dto.characterBoardsData.strength,
      wisdom: dto.characterBoardsData.wisdom,
      expertises: expertises,
      grimorie: dto.grimoireData == null
          ? null
          : GrimoireAdapters.fromDriftData(dto.grimoireData!),
      classes: classes,
      powers: powers,
      origins: origins,
      equipments: equipments,
      actions: actions,
      handToHandAtribute:
          Atribute.values[dto.characterBoardsData.handToHandAtributeIndex ?? 0],
      conditions: conditions,
      inLeftHand: dto.characterBoardsData.inLeftHand,
      inRightHand: dto.characterBoardsData.inRightHand,
      inTwoHands: dto.characterBoardsData.inTwoHands,
      inWearableSlots: dto.characterBoardsData.inWearableSlots,

      globalModifiers: dto.globalModifiers == null
          ? null
          : GlobalModifiersAdapters.fromDriftData(dto.globalModifiers!),
      arcaneArmorEnabled: dto.characterBoardsData.arcaneArmorEnabled ?? false,
      arcaneArmorBaseDefense:
          dto.characterBoardsData.arcaneArmorBaseDefense ?? 0,
    );
  }

  static CharacterBoard fromDriftData(
    CharacterBoardTableData data, [
    List<ClasseCharacterTableData> classesData = const [],
  ]) {
    return CharacterBoard(
      uuid: data.uuid,
      parentuuid: data.parentuuid,
      boardUuid: data.boarduuid,
      isAlive: data.isAlive,
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
      senses: data.senses,
      strength: data.strength,
      wisdom: data.wisdom,
      currentLife: data.currentLife,
      currentMana: data.currentMana,
      inLeftHand: data.inLeftHand,
      inRightHand: data.inRightHand,
      inTwoHands: data.inTwoHands,
      inWearableSlots: data.inWearableSlots,
      expertises: [],
      grimorie: null,
      classes: classesData
          .map(ClasseCharacterTypeAdapters.fromDriftData)
          .toList(),
      powers: [],
      origins: [],
      equipments: [],
      actions: [],
      conditions: [],
      handToHandAtribute: Atribute.values[data.handToHandAtributeIndex ?? 0],
      globalModifiers: null,
      arcaneArmorEnabled: data.arcaneArmorEnabled ?? false,
      arcaneArmorBaseDefense: data.arcaneArmorBaseDefense ?? 0,
    );
  }

  static CharacterBoard createFromCharacter(
    Character entity,
    String boardUuid,
  ) {
    final now = DateTime.now();
    final characterUuid = const Uuid().v4();
    List<Power> powers = [];
    List<Origin> origins = [];
    List<ActionEnt> actions = [];
    List<Equipment> equipments = [];
    List<Expertise> expertises = [];
    List<ExpertiseBase> baseExpertises = ExpertisesBaseService()
        .getExpertises();
    final classe = entity.classe?.copyWith(
      uuid: const Uuid().v4(),
      characterUuid: characterUuid,
    );

    for (var power in entity.powers) {
      powers.add(
        power.copyWith(uuid: const Uuid().v4(), characterUuid: characterUuid),
      );
    }

    for (var origin in entity.origins) {
      origins.add(
        origin.copyWith(uuid: const Uuid().v4(), characterUuid: characterUuid),
      );
    }

    for (var action in entity.actions) {
      actions.add(
        action.cloneWith(uuid: const Uuid().v4(), parentUuid: characterUuid),
      );
    }

    for (var equipment in entity.equipments) {
      equipments.add(
        equipment.cloneWith(uuid: const Uuid().v4(), parentUuid: characterUuid),
      );
    }

    String? storeInUuid;

    if (equipments.any((e) => e is Backpack)) {
      storeInUuid = equipments.firstWhere((e) => e is Backpack).uuid;
    }

    if (equipments.any((e) => e is AdventureBackpack)) {
      storeInUuid = equipments.firstWhere((e) => e is AdventureBackpack).uuid;
    }

    equipments.add(
      Tibars(
        gold: 0,
        silver: 0,
        bronze: 0,
        storedIn: storeInUuid,
        uuid: const Uuid().v4(),
        parentUuid: characterUuid,
        createdAt: now,
        updatedAt: now,
      ),
    );

    print('equipments: $equipments');

    for (var expertise in entity.trainedExpertises) {
      expertises.add(
        ExpertiseAdapters.createfromBaseCharacter(
          expertise,
          characterUuid,
          true,
        ),
      );
    }

    for (var base in baseExpertises) {
      if (!(expertises.any((e) => e.id == base.id))) {
        expertises.add(
          ExpertiseAdapters.createfromBaseCharacter(base, characterUuid, false),
        );
      }
    }

    final globalModifier = GlobalModifiers(
      parentUuid: characterUuid,
      uuid: const Uuid().v7(),
      rool: 0,
      bonusAttack: 0,
      expertises: 0,
      resistances: 0,
      damage: 0,
      defense: 0,
      bonusArmor: 0,
      bonusShield: 0,
      others: 0,
    );

    return CharacterBoard(
      uuid: characterUuid,
      parentuuid: entity.uuid,
      boardUuid: boardUuid,
      isAlive: true,
      alignmentType: entity.alignmentType,
      brood: entity.brood,
      createdAt: now,
      updatedAt: now,
      creatureSize: entity.creatureSize,
      defense: entity.defense,
      life: entity.life,
      mana: entity.mana,
      name: entity.name,
      charisma: entity.charisma,
      constitution: entity.constitution,
      dexterity: entity.dexterity,
      displacement: entity.displacement,
      divinityId: entity.divinityId,
      imageAsset: entity.imageAsset,
      imagePath: entity.imagePath,
      intelligence: entity.intelligence,
      senses: entity.senses,
      strength: entity.strength,
      wisdom: entity.wisdom,
      currentLife: entity.life,
      currentMana: entity.mana,
      inLeftHand: null,
      inRightHand: null,
      inTwoHands: null,
      inWearableSlots: null,
      expertises: expertises,
      grimorie: entity.grimorie,
      classes: classe == null ? [] : [classe],
      powers: powers,
      origins: origins,
      equipments: equipments,
      actions: actions,
      conditions: [],
      handToHandAtribute: Atribute.strength,
      globalModifiers: globalModifier,
      arcaneArmorEnabled: false,
      arcaneArmorBaseDefense: 0,
    );
  }

  static CharacterBoardTableCompanion toDriftCompanion(CharacterBoard entity) {
    return CharacterBoardTableCompanion(
      uuid: Value(entity.uuid),
      isAlive: Value(entity.isAlive),
      parentuuid: Value(entity.parentuuid),
      boarduuid: Value(entity.boardUuid),
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
      senses: Value(entity.senses),
      strength: Value(entity.strength ?? 0),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
      wisdom: Value(entity.wisdom ?? 0),
      currentLife: Value(entity.currentLife),
      currentMana: Value(entity.currentMana),
      inLeftHand: Value(entity.inLeftHand),
      inRightHand: Value(entity.inRightHand),
      inTwoHands: Value(entity.inTwoHands),
      inWearableSlots: Value(entity.inWearableSlots),
      handToHandAtributeIndex: Value(entity.handToHandAtribute.index),
      arcaneArmorBaseDefense: Value(entity.arcaneArmorBaseDefense),
      arcaneArmorEnabled: Value(entity.arcaneArmorEnabled),
    );
  }

  static CharacterBoard fromJson(Map<String, dynamic> data) {
    final now = DateTime.now();
    return CharacterBoard(
      uuid: data['uuid'],
      parentuuid: data['parent_uuid'],
      boardUuid: data['board_uuid'],
      isAlive: data['is_alive'],
      alignmentType: CharacterAlignmentType.values[data['aligment_index']],
      brood: Brood.values[data['brood_index']],
      createdAt: DateTime.tryParse(data['created_at'] ?? '') ?? now,
      updatedAt: DateTime.tryParse(data['updated_at'] ?? '') ?? now,
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
      senses: data['senses'],
      strength: data['strength'],
      wisdom: data['wisdom'],
      currentLife: data['current_life'],
      currentMana: data['current_mana'],
      inLeftHand: data['in_left_hand'],
      inRightHand: data['in_right_hand'],
      inTwoHands: data['in_two_hands'],
      inWearableSlots: data['in_wearable_slots'],
      handToHandAtribute:
          Atribute.values[data['hand_to_hand_atribute_index'] ?? 0],
      expertises: [],
      grimorie: null,
      classes: [],
      powers: [],
      origins: [],
      equipments: [],
      actions: [],
      conditions: [],
      globalModifiers: null,
      arcaneArmorEnabled: data['arcane_armor_enabled'] ?? false,
      arcaneArmorBaseDefense: data['arcane_armor_base_defense'] ?? 0,
    );
  }

  static Map<String, dynamic> toJson(CharacterBoard entity) {
    final perceptionIsTrained = entity.expertises
        .firstWhere((e) => e.name == 'percepção')
        .isTrained;
    final perception = entity.wisdom ?? 0 + (perceptionIsTrained ? 2 : 0);
    return {
      'uuid': entity.uuid,
      'parent_uuid': entity.parentuuid,
      'board_uuid': entity.boardUuid,
      'is_alive': entity.isAlive,
      'aligment_index': entity.alignmentType.index,
      'brood_index': entity.brood.index,
      'created_at': entity.createdAt.toIso8601String(),
      'updated_at': entity.updatedAt.toIso8601String(),
      'creature_size_index': entity.creatureSize.index,
      'defense': entity.defense,
      'life': entity.life,
      'mana': entity.mana,
      'name': entity.name,
      'charisma': entity.charisma,
      'constitution': entity.constitution,
      'dexterity': entity.dexterity,
      'displacement': entity.displacement,
      'divinity_id': entity.divinityId,
      'image_asset': entity.imageAsset,
      'intelligence': entity.intelligence,
      'perception': perception,
      'senses': entity.senses,
      'strength': entity.strength,
      'wisdom': entity.wisdom,
      'current_life': entity.currentLife,
      'current_mana': entity.currentMana,
      'in_left_hand': entity.inLeftHand,
      'in_right_hand': entity.inRightHand,
      'in_two_hands': entity.inTwoHands,
      'in_wearable_slots': entity.inWearableSlots,
      'hand_to_hand_atribute_index': entity.handToHandAtribute.index,
      'arcane_armor_base_defense': entity.arcaneArmorBaseDefense,
      'arcane_armor_enabled': entity.arcaneArmorEnabled,
      'classe_indexes': entity.classes
          .map((cl) => cl.type.index)
          .toList()
          .join(','),
    };
  }
}
