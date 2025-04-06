import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_adapters.dart';
import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventure_backpack_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventurere_backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_adapters.dart';
import 'package:tormenta20/src/shared/entities/menace_drift_dto.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_adapters.dart';
import 'package:tormenta20/src/shared/entities/general_skill_adapters.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace_adapters.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board_adapters.dart';
import 'package:tormenta20/src/shared/entities/menace_type.dart';
import 'package:tormenta20/src/shared/entities/treasure_type.dart';

abstract class MenaceAdapters {
  static Menace fromDriftDto(MenaceDriftDto dto) {
    final treasures = dto.data.treasureTypeIndex == null
        ? null
        : TreasureType.values[dto.data.treasureTypeIndex!];

    List<ActionEnt> actions = [];
    actions.addAll(dto.actions.map(ActionAdapters.fromDriftData));
    actions
        .addAll(dto.attackDistances.map(DistanceAttackAdapters.fromDriftData));
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
    return Menace(
      createdAt: DateTime.fromMillisecondsSinceEpoch(dto.data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(dto.data.updatedAt),
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
      expertises: dto.expertises.map(ExpertiseAdapters.fromDriftData).toList(),
      boards: dto.boards.map(BoardAdapters.fromDriftData).toList(),
      generalSkills:
          dto.generalSkills.map(GeneralSkillAdapters.fromDriftData).toList(),
      boardsLinkeds:
          dto.boardsLinkeds.map(MenaceLinkBoardAdapters.fromDriftData).toList(),
      actions: actions,
      equipments: equipments,
    );
  }

  static Menace fromDriftData(MenaceTableData data) {
    final treasures = data.treasureTypeIndex == null
        ? null
        : TreasureType.values[data.treasureTypeIndex!];
    return Menace(
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
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
      boards: [],
      boardsLinkeds: [],
    );
  }

  static Menace fromJson(Map<String, dynamic> data) {
    final now = DateTime.now();
    List<ActionEnt> actions = [];
    List<Equipment> equipments = [];

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
    return Menace(
      createdAt: DateTime.tryParse(data['created_at']) ?? now,
      updatedAt: DateTime.tryParse(data['updated_at']) ?? now,
      uuid: data['uuid'],
      type: MenaceType.values[data['type_index']],
      name: data['name'],
      charisma: data['charisma'],
      desc: data['desc'],
      combatRole: CombatRole.values[data['combate_role_index']],
      constitution: data['constitution'],
      creatureSize: CreatureSizeCategory.values[data['creature_size_index']],
      defense: data['defense'],
      dexterity: data['dexterity'],
      fortResistence: data['fort_resistence'],
      initiative: data['initiative'],
      intelligence: data['intelligence'],
      life: data['life'],
      mana: data['mana'],
      nd: data['nd'],
      wisdom: data['wisdom'],
      strength: data['strength'],
      perception: data['perception'],
      imageAsset: data['imageAsset'],
      refResistence: data['ref_resistence'],
      imagePath: null,
      extraInfos: data['extra_infos'] ?? '',
      casterInfos: data['caster_infos'] ?? '',
      divinityId: data['divinity_id'] ?? '',
      senses: data['senses'] ?? '',
      magics: (data['magics'] as List)
          .map((e) => MagicMenaceAdapters.fromJson(e))
          .toList(),
      boardsLinkeds: [],
      boards: [],
      actions: actions,
      displacement: data['displacement'],
      expertises: (data['expertises'] as List)
          .map((e) => ExpertiseAdapters.fromJson(e))
          .toList(),
      generalSkills: (data['general_Skills'] as List)
          .map((e) => GeneralSkillAdapters.fromJson(e))
          .toList(),
      equipments: equipments,
      vonResistence: data['von_resistence'],
      treasures: TreasureType.values[data['treasures_index']],
    );
  }

  static Map<String, dynamic> toJson(Menace entity) {
    final data = {
      'uuid': entity.uuid,
      'name': entity.name,
      'desc': entity.desc,
      'type_index': entity.type.index,
      'charisma': entity.charisma,
      'combate_role_index': entity.combatRole.index,
      'constitution': entity.constitution,
      'creature_size_index': entity.creatureSize.index,
      'defense': entity.defense,
      'dexterity': entity.dexterity,
      'fort_resistence': entity.fortResistence,
      'initiative': entity.initiative,
      'intelligence': entity.intelligence,
      'life': entity.life,
      'mana': entity.mana,
      'nd': entity.nd,
      'wisdom': entity.wisdom,
      'strength': entity.strength,
      'perception': entity.perception,
      'imageAsset': entity.imageAsset,
      'ref_resistence': entity.refResistence,
      'image_path': null,
      'extra_infos': entity.extraInfos ?? '',
      'caster_infos': entity.casterInfos ?? '',
      'divinity_id': entity.divinityId ?? '',
      'senses': entity.senses ?? '',
      'created_at': entity.createdAt.toIso8601String(),
      'displacement': entity.displacement,
      'treasures_index': entity.treasures?.index ?? 0,
    };

    if (entity.magics.isNotEmpty) {
      data['magics'] = entity.magics.map(MagicMenaceAdapters.toJson).toList();
    }

    if (entity.expertises.isNotEmpty) {
      data['expertises'] =
          entity.expertises.map(ExpertiseAdapters.toJson).toList();
    }

    if (entity.generalSkills.isNotEmpty) {
      data['general_skills'] =
          entity.generalSkills.map(GeneralSkillAdapters.toJson).toList();
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

    if (entity.equipments.isNotEmpty) {
      List<AdventureBackpack> adventureBackpacks = [];
      List<Ammunition> ammunitions = [];
      List<Armor> armors = [];
      List<Backpack> backpacks = [];
      List<GeneralItem> generalItems = [];
      List<Saddlebag> saddlebags = [];
      List<Shield> shields = [];
      List<Weapon> weapons = [];
      List<Equipment> equipments = [];

      for (var equipament in entity.equipments) {
        if (equipament is AdventureBackpack) {
          adventureBackpacks.add(equipament);
        } else if (equipament is Ammunition) {
          ammunitions.add(equipament);
        } else if (equipament is Armor) {
          armors.add(equipament);
        } else if (equipament is Backpack) {
          backpacks.add(equipament);
        } else if (equipament is GeneralItem) {
          generalItems.add(equipament);
        } else if (equipament is Saddlebag) {
          saddlebags.add(equipament);
        } else if (equipament is Shield) {
          shields.add(equipament);
        } else if (equipament is Weapon) {
          weapons.add(equipament);
        } else {
          equipments.add(equipament);
        }
      }

      if (adventureBackpacks.isNotEmpty) {
        data.addAll({
          'adventure_backpack': adventureBackpacks
              .map((e) => AdventureBackpackAdapters.toJson(e))
              .toList()
        });
      }

      if (equipments.isNotEmpty) {
        data.addAll({
          'equipments':
              equipments.map((e) => EquipmentAdapters.toJson(e)).toList()
        });
      }

      if (backpacks.isNotEmpty) {
        data.addAll({
          'backpacks': backpacks.map((e) => BackpackAdapters.toJson(e)).toList()
        });
      }

      if (saddlebags.isNotEmpty) {
        data.addAll({
          'saddlebags':
              saddlebags.map((e) => SaddlebagAdapters.toJson(e)).toList()
        });
      }

      if (ammunitions.isNotEmpty) {
        data.addAll({
          'ammunitions':
              ammunitions.map((e) => AmmunitionAdapters.toJson(e)).toList()
        });
      }

      if (armors.isNotEmpty) {
        data.addAll(
            {'armors': armors.map((e) => ArmorAdapters.toJson(e)).toList()});
      }

      if (generalItems.isNotEmpty) {
        data.addAll({
          'general_items':
              generalItems.map((e) => GeneralItemAdapters.toJson(e)).toList()
        });
      }

      if (shields.isNotEmpty) {
        data.addAll(
            {'shields': shields.map((e) => ShieldAdapters.toJson(e)).toList()});
      }

      if (weapons.isNotEmpty) {
        data.addAll(
            {'weapons': weapons.map((e) => WeaponAdapters.toJson(e)).toList()});
      }
    }

    return data;
  }

  static MenaceTableCompanion toDriftCompanion(Menace entity) {
    return MenaceTableCompanion(
      createdAt: Value(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      desc: Value(entity.desc),
      typeIndex: Value(entity.type.index),
      casterInfos: Value(entity.casterInfos),
      charisma: Value(entity.charisma ?? 0),
      combateRoleIndex: Value(entity.combatRole.index),
      constitution: Value(entity.constitution ?? 0),
      creatureSizeIndex: Value(entity.creatureSize.index),
      defense: Value(entity.defense),
      dexterity: Value(entity.dexterity ?? 0),
      displacement: Value(entity.displacement),
      divinityId: Value(entity.divinityId),
      extraInfos: Value(entity.extraInfos),
      fortResistence: Value(entity.fortResistence ?? 0),
      imageAsset: Value(entity.imageAsset),
      imagePath: Value(entity.imagePath),
      initiative: Value(entity.initiative),
      intelligence: Value(entity.intelligence ?? 0),
      life: Value(entity.life),
      mana: Value(entity.mana),
      nd: Value(entity.nd),
      perception: Value(entity.perception ?? 0),
      refResistence: Value(entity.refResistence ?? 0),
      senses: Value(entity.senses),
      strength: Value(entity.strength ?? 0),
      treasureTypeIndex: Value(entity.treasures?.index),
      vonResistence: Value(entity.vonResistence ?? 0),
      wisdom: Value(entity.wisdom ?? 0),
    );
  }
}
