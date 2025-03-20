import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character_alignment_type.dart';
import 'package:tormenta20/src/shared/entities/classe_type_character.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/entities/power.dart';

class CharacterBoard extends EntityBase {
  final String uuid;
  final String parentuuid;
  final String boardUuid;
  final bool isAlive;
  final String name;
  final Brood brood;
  final int defense;
  final int life;
  final int mana;
  final CreatureSizeCategory creatureSize;
  final String? imagePath;
  final String? imageAsset;
  final String? displacement;
  final int? perception;
  final int? strength;
  final int? dexterity;
  final int? constitution;
  final int? intelligence;
  final int? wisdom;
  final int? charisma;
  final int? divinityId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Grimoire? grimorie;
  final String? senses;
  final List<ClasseTypeCharacter> classes;
  final List<Origin> origins;
  final List<Equipment> equipments;
  final List<ActionEnt> actions;
  final List<Expertise> expertises;
  final List<Power> powers;
  final CharacterAlignmentType alignmentType;

  CharacterBoard({
    required this.uuid,
    required this.parentuuid,
    required this.boardUuid,
    required this.isAlive,
    required this.classes,
    required this.name,
    required this.origins,
    this.imagePath,
    required this.brood,
    this.imageAsset,
    this.divinityId,
    required this.defense,
    required this.life,
    required this.mana,
    required this.creatureSize,
    this.displacement,
    this.perception,
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
    required this.createdAt,
    required this.updatedAt,
    this.grimorie,
    this.senses,
    required this.equipments,
    required this.actions,
    required this.expertises,
    required this.powers,
    required this.alignmentType,
  });

  @override
  bool operator ==(other) =>
      other is CharacterBoard &&
      other.uuid == uuid &&
      other.classes == classes &&
      other.imagePath == imagePath &&
      other.name == name &&
      other.brood == brood &&
      other.divinityId == divinityId &&
      other.origins == origins &&
      other.defense == defense &&
      other.life == life &&
      other.mana == mana &&
      other.creatureSize == creatureSize &&
      other.displacement == displacement &&
      other.perception == perception &&
      other.strength == strength &&
      other.dexterity == dexterity &&
      other.constitution == constitution &&
      other.intelligence == intelligence &&
      other.wisdom == wisdom &&
      other.charisma == charisma &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.grimorie == grimorie &&
      other.senses == senses &&
      other.equipments == equipments &&
      other.actions == actions &&
      other.expertises == expertises &&
      other.powers == powers &&
      other.parentuuid == parentuuid &&
      other.boardUuid == boardUuid &&
      other.isAlive == isAlive &&
      other.alignmentType == alignmentType &&
      other.imageAsset == imageAsset;

  @override
  int get hashCode =>
      uuid.hashCode ^
      classes.hashCode ^
      imagePath.hashCode ^
      name.hashCode ^
      isAlive.hashCode ^
      boardUuid.hashCode ^
      parentuuid.hashCode ^
      divinityId.hashCode ^
      origins.hashCode ^
      brood.hashCode ^
      defense.hashCode ^
      life.hashCode ^
      mana.hashCode ^
      creatureSize.hashCode ^
      displacement.hashCode ^
      perception.hashCode ^
      strength.hashCode ^
      dexterity.hashCode ^
      constitution.hashCode ^
      intelligence.hashCode ^
      wisdom.hashCode ^
      charisma.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      grimorie.hashCode ^
      senses.hashCode ^
      equipments.hashCode ^
      actions.hashCode ^
      expertises.hashCode ^
      powers.hashCode ^
      alignmentType.hashCode ^
      imageAsset.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
