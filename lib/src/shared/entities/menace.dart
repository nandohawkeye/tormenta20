import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/entities/creature_size.dart';
import 'package:tormenta20/src/shared/entities/creature_vision.dart';
import 'package:tormenta20/src/shared/entities/menace_type.dart';

class Menace {
  final String? imagePath;
  final String? imageAsset;
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
  final CreatureVision vision;

  final String displacements;
  final List<String> actions;
  final List<String> expertises;
  final List<String> treasures;
  final List<String> weaknesses;

  Menace({
    this.imagePath,
    this.imageAsset,
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
    required this.displacements,
    required this.actions,
    required this.expertises,
    required this.treasures,
    required this.vision,
    required this.weaknesses,
    required this.fortResistence,
    required this.refResistence,
    required this.vonResistence,
    required this.strength,
    required this.charisma,
    required this.constitution,
    required this.dexterity,
    required this.intelligence,
    required this.wisdom,
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
      other.vision == vision &&
      other.imagePath == imagePath &&
      other.imageAsset == imageAsset &&
      other.weaknesses == weaknesses &&
      other.fortResistence == fortResistence &&
      other.refResistence == refResistence &&
      other.vonResistence == vonResistence &&
      other.strength == strength &&
      other.charisma == charisma &&
      other.constitution == constitution &&
      other.dexterity == dexterity &&
      other.wisdom == wisdom &&
      other.charisma == charisma;

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
      vision.hashCode ^
      imagePath.hashCode ^
      imageAsset.hashCode ^
      weaknesses.hashCode ^
      fortResistence.hashCode ^
      refResistence.hashCode ^
      vonResistence.hashCode ^
      strength.hashCode ^
      charisma.hashCode ^
      constitution.hashCode ^
      dexterity.hashCode ^
      wisdom.hashCode ^
      charisma.hashCode;
}

// básicos pra salvar de uma ameaça é o nome e ND, tipo e tamanho, papel de combate, 
// iniciativa e percepção, defesa e resistência, pontos de vida e mana, deslocamento, 
// ações, perícias, atributos, equipamentos e tesouro.