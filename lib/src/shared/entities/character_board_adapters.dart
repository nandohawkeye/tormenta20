import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character_alignment_type.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';

abstract class CharacterBoardAdapters {
  static CharacterBoard fromDriftData(CharacterBoardTableData data) {
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
      perception: data.perception,
      senses: data.senses,
      strength: data.strength,
      wisdom: data.wisdom,
      expertises: [],
      grimorie: null,
      classes: [],
      powers: [],
      origins: [],
      equipments: [],
      actions: [],
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
      perception: Value(entity.perception ?? 0),
      senses: Value(entity.senses),
      strength: Value(entity.strength ?? 0),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
      wisdom: Value(entity.wisdom ?? 0),
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
      expertises: [],
      grimorie: null,
      classes: [],
      powers: [],
      origins: [],
      equipments: [],
      actions: [],
    );
  }

  static Map<String, dynamic> toJson(CharacterBoard entity) {
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
      'perception': entity.perception,
      'senses': entity.senses,
      'strength': entity.strength,
      'wisdom': entity.wisdom,
    };
  }
}
