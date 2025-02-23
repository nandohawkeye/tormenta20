import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/entities/creature_size.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';
import 'package:tormenta20/src/shared/entities/menace_type.dart';
import 'package:tormenta20/src/shared/entities/treasure_type.dart';

class Menace {
  final String? imagePath;
  final String? imageAsset;
  final String? displacement;
  final String name;
  final String nd;
  final String uuid;
  final int initiative;
  final int perception;
  final int defense;
  final int life;
  final int mana;

  final int fortResistence;
  final int refResistence;
  final int vonResistence;

  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  final MenaceType type;
  final CreatureSize creatureSize;
  final CombatRole combatRole;
  final String? senses;
  final int? divinityId;
  final List<GeneralSkill> generalSkills;
  final String? casterInfos;
  //padrão, metade, doblo, na rolagem pra dinheiro e item
  final TreasureType? treasures;

  final List<MagicMenace> magics;
  final List<String> actions;
  final List<String> expertises;
  final List<String> equipments;

  final String? desc;
  final String? extraInfos;

  Menace({
    this.imagePath,
    this.imageAsset,
    this.displacement,
    this.desc,
    this.extraInfos,
    this.divinityId,
    this.casterInfos,
    this.treasures,
    required this.magics,
    required this.uuid,
    required this.name,
    required this.nd,
    required this.type,
    required this.creatureSize,
    required this.combatRole,
    required this.initiative,
    required this.perception,
    required this.defense,
    required this.life,
    required this.mana,
    required this.actions,
    required this.expertises,
    required this.senses,
    required this.generalSkills,
    required this.fortResistence,
    required this.refResistence,
    required this.vonResistence,
    required this.strength,
    required this.charisma,
    required this.constitution,
    required this.dexterity,
    required this.intelligence,
    required this.wisdom,
    required this.equipments,
  });

  @override
  bool operator ==(other) =>
      other is Menace &&
      other.uuid == uuid &&
      other.nd == nd &&
      other.type == type &&
      other.name == name &&
      other.creatureSize == creatureSize &&
      other.combatRole == combatRole &&
      other.initiative == initiative &&
      other.perception == perception &&
      other.defense == defense &&
      other.mana == mana &&
      other.life == life &&
      other.actions == actions &&
      other.expertises == expertises &&
      other.treasures == treasures &&
      other.senses == senses &&
      other.imagePath == imagePath &&
      other.imageAsset == imageAsset &&
      other.generalSkills == generalSkills &&
      other.fortResistence == fortResistence &&
      other.refResistence == refResistence &&
      other.vonResistence == vonResistence &&
      other.strength == strength &&
      other.charisma == charisma &&
      other.constitution == constitution &&
      other.dexterity == dexterity &&
      other.wisdom == wisdom &&
      other.charisma == charisma &&
      other.equipments == equipments &&
      other.desc == desc &&
      other.extraInfos == extraInfos &&
      other.divinityId == divinityId &&
      other.casterInfos == casterInfos &&
      other.magics == magics;

  @override
  int get hashCode =>
      uuid.hashCode ^
      nd.hashCode ^
      type.hashCode ^
      name.hashCode ^
      creatureSize.hashCode ^
      combatRole.hashCode ^
      initiative.hashCode ^
      defense.hashCode ^
      perception.hashCode ^
      mana.hashCode ^
      life.hashCode ^
      actions.hashCode ^
      expertises.hashCode ^
      treasures.hashCode ^
      senses.hashCode ^
      imagePath.hashCode ^
      imageAsset.hashCode ^
      generalSkills.hashCode ^
      fortResistence.hashCode ^
      refResistence.hashCode ^
      vonResistence.hashCode ^
      strength.hashCode ^
      charisma.hashCode ^
      constitution.hashCode ^
      dexterity.hashCode ^
      wisdom.hashCode ^
      charisma.hashCode ^
      equipments.hashCode ^
      desc.hashCode ^
      extraInfos.hashCode ^
      divinityId.hashCode ^
      casterInfos.hashCode ^
      magics.hashCode;
}

// básicos pra salvar de uma ameaça é o nome e ND, tipo e tamanho, papel de combate, 
// iniciativa e percepção, defesa e resistência, pontos de vida e mana, deslocamento, 
// ações, perícias, atributos, equipamentos e tesouro.