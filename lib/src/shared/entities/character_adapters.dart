import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand_adapters.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/entities/character_alignment_type.dart';
import 'package:tormenta20/src/shared/entities/character_board_adapters.dart';
import 'package:tormenta20/src/shared/entities/character_dto.dart';
import 'package:tormenta20/src/shared/entities/classe_character_type_adapters.dart';
import 'package:tormenta20/src/shared/entities/classe_type_character.dart';
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
    ClasseTypeCharacter? classe;
    List<Power> powers = [];
    List<Origin> origins = [];
    List<ActionEnt> actions = [];
    List<Equipment> equipments = [];

    if (data['classe'] != null) {
      classe = ClasseCharacterTypeAdapters.fromJson(data['classe']);
    }

    if (data['powers'] != null && (data['powers'] as List).isNotEmpty) {
      powers.addAll((data['powers'] as List)
          .map((e) => PowerAdapters.fromJson(e))
          .toList());
    }

    if (data['origins'] != null && (data['origins'] as List).isNotEmpty) {
      origins.addAll((data['origins'] as List)
          .map((e) => OriginAdapters.fromJson(e))
          .toList());
    }

    if (data['actions'] != null && (data['actions'] as List).isNotEmpty) {
      actions.addAll((data['actions'] as List)
          .map((e) => ActionAdapters.fromJson(e))
          .toList());
    }

    if (data['distance_attacks'] != null &&
        (data['distance_attacks'] as List).isNotEmpty) {
      actions.addAll((data['distance_attacks'] as List)
          .map((e) => DistanceAttackAdapters.fromJson(e))
          .toList());
    }

    if (data['hand_to_hands'] != null &&
        (data['hand_to_hands'] as List).isNotEmpty) {
      actions.addAll((data['hand_to_hands'] as List)
          .map((e) => HandToHandAdapters.fromJson(e))
          .toList());
    }

    if (data['adventure_backpack'] != null &&
        (data['adventure_backpack'] as List).isNotEmpty) {
      equipments.addAll((data['adventure_backpack'] as List)
          .map((e) => AdventureBackpackAdapters.fromJson(e))
          .toList());
    }

    if (data['ammunitions'] != null &&
        (data['ammunitions'] as List).isNotEmpty) {
      equipments.addAll((data['ammunitions'] as List)
          .map((e) => AmmunitionAdapters.fromJson(e))
          .toList());
    }

    if (data['armors'] != null && (data['armors'] as List).isNotEmpty) {
      equipments.addAll((data['armors'] as List)
          .map((e) => ArmorAdapters.fromJson(e))
          .toList());
    }

    if (data['backpacks'] != null && (data['backpacks'] as List).isNotEmpty) {
      equipments.addAll((data['backpacks'] as List)
          .map((e) => BackpackAdapters.fromJson(e))
          .toList());
    }

    if (data['equipments'] != null && (data['equipments'] as List).isNotEmpty) {
      equipments.addAll((data['equipments'] as List)
          .map((e) => EquipmentAdapters.fromJson(e))
          .toList());
    }

    if (data['general_items'] != null &&
        (data['general_items'] as List).isNotEmpty) {
      equipments.addAll((data['general_items'] as List)
          .map((e) => GeneralItemAdapters.fromJson(e))
          .toList());
    }

    if (data['saddlebags'] != null && (data['saddlebags'] as List).isNotEmpty) {
      equipments.addAll((data['saddlebags'] as List)
          .map((e) => SaddlebagAdapters.fromJson(e))
          .toList());
    }

    if (data['shields'] != null && (data['shields'] as List).isNotEmpty) {
      equipments.addAll((data['shields'] as List)
          .map((e) => ShieldAdapters.fromJson(e))
          .toList());
    }

    if (data['weapons'] != null && (data['weapons'] as List).isNotEmpty) {
      equipments.addAll((data['weapons'] as List)
          .map((e) => WeaponAdapters.fromJson(e))
          .toList());
    }

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
      classe: classe,
      powers: powers,
      origins: origins,
      equipments: equipments,
      actions: actions,
    );
  }

  static Map<String, dynamic> toJson(Character entity) {
    final data = {
      'uuid': entity.uuid,
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
      'image_path': null,
      'intelligence': entity.intelligence,
      'perception': entity.perception,
      'senses': entity.senses,
      'strength': entity.strength,
      'wisdom': entity.wisdom,
    };

    if (entity.classe != null) {
      data.addAll(
          {'classe': ClasseCharacterTypeAdapters.toJson(entity.classe!)});
    }

    if (entity.powers.isNotEmpty) {
      data.addAll({
        'powers': entity.powers.map((e) => PowerAdapters.toJson(e)).toList()
      });
    }

    if (entity.origins.isNotEmpty) {
      data.addAll({
        'origins': entity.origins.map((e) => OriginAdapters.toJson(e)).toList()
      });
    }

    if (entity.actions.isNotEmpty) {
      List<dynamic> actionsData = [];
      List<dynamic> distanceAttacksData = [];
      List<dynamic> handToHandsData = [];

      for (var action in entity.actions) {
        if (action is DistanceAttack) {
          distanceAttacksData.add(DistanceAttackAdapters.toJson(action));
        } else if (action is HandToHand) {
          handToHandsData.add(HandToHandAdapters.toJson(action));
        } else {
          actionsData.add(ActionAdapters.toJson(action));
        }
      }

      if (actionsData.isNotEmpty) {
        data.addAll({'actions': actionsData});
      }

      if (distanceAttacksData.isNotEmpty) {
        data.addAll({'distance_attacks': distanceAttacksData});
      }

      if (handToHandsData.isNotEmpty) {
        data.addAll({'hand_to_hands': handToHandsData});
      }
    }

    //TODO implement this
    // if(entity.equipments.isNotEmpty) {
    //   data.addAll({
    //     'equipments': entity.equipments.map((e) => EquipmentAdapters.toJson(e)).toList()
    //   });
    // }

    return data;
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
