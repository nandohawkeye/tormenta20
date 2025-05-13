import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character_alignment_type.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/entities/classe_type_character.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/entities/power.dart';

class Character extends EntityBase {
  final String uuid;
  final String name;
  final Brood brood;
  final int defense;
  final int life;
  final int mana;
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
  final ClasseTypeCharacter? classe;
  final List<Origin> origins;
  final List<Equipment> equipments;
  final List<ActionEnt> actions;
  final List<ExpertiseBase> trainedExpertises;
  final List<Power> powers;
  final List<CharacterBoard> characterBoards;
  final CharacterAlignmentType alignmentType;

  Character({
    required this.uuid,
    this.classe,
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
    required this.trainedExpertises,
    required this.powers,
    required this.alignmentType,
    required this.characterBoards,
  });

  Character updateGrimoire(Grimoire? grimorie) {
    return Character(
      uuid: uuid,
      name: name,
      origins: origins,
      brood: brood,
      defense: defense,
      life: life,
      mana: mana,
      creatureSize: creatureSize,
      createdAt: createdAt,
      updatedAt: updatedAt,
      equipments: equipments,
      actions: actions,
      trainedExpertises: trainedExpertises,
      powers: powers,
      alignmentType: alignmentType,
      characterBoards: characterBoards,
      charisma: charisma,
      classe: classe,
      constitution: constitution,
      dexterity: dexterity,
      displacement: displacement,
      divinityId: divinityId,
      grimorie: grimorie,
      imageAsset: imageAsset,
      intelligence: intelligence,
      imagePath: imagePath,
      senses: senses,
      strength: strength,
      wisdom: wisdom,
    );
  }

  @override
  bool operator ==(other) =>
      other is Character &&
      other.uuid == uuid &&
      other.classe == classe &&
      other.imagePath == imagePath &&
      other.name == name &&
      other.brood == brood &&
      other.divinityId == divinityId &&
      other.origins == origins &&
      other.defense == defense &&
      other.life == life &&
      other.characterBoards == characterBoards &&
      other.mana == mana &&
      other.creatureSize == creatureSize &&
      other.displacement == displacement &&
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
      other.trainedExpertises == trainedExpertises &&
      other.powers == powers &&
      other.alignmentType == alignmentType &&
      other.imageAsset == imageAsset;

  @override
  int get hashCode =>
      uuid.hashCode ^
      classe.hashCode ^
      imagePath.hashCode ^
      name.hashCode ^
      characterBoards.hashCode ^
      divinityId.hashCode ^
      origins.hashCode ^
      brood.hashCode ^
      defense.hashCode ^
      life.hashCode ^
      mana.hashCode ^
      creatureSize.hashCode ^
      displacement.hashCode ^
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
      trainedExpertises.hashCode ^
      powers.hashCode ^
      alignmentType.hashCode ^
      imageAsset.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
