import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character_alignment_type.dart';
import 'package:tormenta20/src/shared/entities/character_conditions.dart';
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
  final int currentLife;
  final int mana;
  final int currentMana;
  final CreatureSizeCategory creatureSize;
  final String? imagePath;
  final String? imageAsset;
  final String? displacement;
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
  final String? inLeftHand;
  final String? inRightHand;
  final String? inTwoHands;
  final String? inWearableSlots;
  final Atribute handToHandAtribute;
  final List<CharacterConditions> conditions;

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
    required this.currentLife,
    required this.currentMana,
    this.inLeftHand,
    this.inRightHand,
    this.inTwoHands,
    this.inWearableSlots,
    required this.handToHandAtribute,
    required this.conditions,
  });

  CharacterBoard copyWith({
    String? uuid,
    String? parentuuid,
    String? boardUuid,
    bool? isAlive,
    String? name,
    Brood? brood,
    int? defense,
    int? life,
    int? currentLife,
    int? mana,
    int? currentMana,
    CreatureSizeCategory? creatureSize,
    String? imagePath,
    String? imageAsset,
    String? displacement,
    int? perception,
    int? strength,
    int? dexterity,
    int? constitution,
    int? intelligence,
    int? wisdom,
    int? charisma,
    int? divinityId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Grimoire? grimorie,
    String? senses,
    List<ClasseTypeCharacter>? classes,
    List<Origin>? origins,
    List<Equipment>? equipments,
    List<ActionEnt>? actions,
    List<Expertise>? expertises,
    List<Power>? powers,
    CharacterAlignmentType? alignmentType,
    String? inLeftHand,
    String? inRightHand,
    String? inTwoHands,
    String? inWearableSlots,
    Atribute? handToHandAtribute,
    List<CharacterConditions>? conditions,
  }) {
    return CharacterBoard(
      uuid: uuid ?? this.uuid,
      parentuuid: parentuuid ?? this.parentuuid,
      boardUuid: boardUuid ?? this.boardUuid,
      isAlive: isAlive ?? this.isAlive,
      name: name ?? this.name,
      brood: brood ?? this.brood,
      defense: defense ?? this.defense,
      life: life ?? this.life,
      currentLife: currentLife ?? this.currentLife,
      mana: mana ?? this.mana,
      currentMana: currentMana ?? this.currentMana,
      creatureSize: creatureSize ?? this.creatureSize,
      imagePath: imagePath ?? this.imagePath,
      imageAsset: imageAsset ?? this.imageAsset,
      displacement: displacement ?? this.displacement,
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
      divinityId: divinityId ?? this.divinityId,
      createdAt: createdAt ?? this.createdAt.toUtc(),
      updatedAt: updatedAt ?? DateTime.now().toUtc(),
      classes: classes ?? this.classes,
      origins: origins ?? this.origins,
      grimorie: grimorie ?? this.grimorie,
      senses: senses ?? this.senses,
      equipments: equipments ?? this.equipments,
      actions: actions ?? this.actions,
      expertises: expertises ?? this.expertises,
      powers: powers ?? this.powers,
      alignmentType: alignmentType ?? this.alignmentType,
      inLeftHand: inLeftHand ?? this.inLeftHand,
      inRightHand: inRightHand ?? this.inRightHand,
      inTwoHands: inTwoHands ?? this.inTwoHands,
      inWearableSlots: inWearableSlots ?? this.inWearableSlots,
      conditions: conditions ?? this.conditions,
      handToHandAtribute: handToHandAtribute ?? this.handToHandAtribute,
    );
  }

  @override
  bool operator ==(other) =>
      other is CharacterBoard &&
      other.uuid == uuid &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

  @override
  int get hashCode => uuid.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
