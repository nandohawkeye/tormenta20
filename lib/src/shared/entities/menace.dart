import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/entities/creature_size.dart';
import 'package:tormenta20/src/shared/entities/creature_vision.dart';
import 'package:tormenta20/src/shared/entities/menace_type.dart';

class Menace {
  final String uuid;
  final String name;
  final String nd;
  final MenaceType type;
  final CreatureSize creatureSize;
  final CombatRole combatRole;
  final int initiative;
  final int perception;
  final int defense;
  final int life;
  final int mana;
  //Exemple fort:+3_ref:-1_von:-1
  final String resistences;
  final double displacement;
  final CreatureVision vision;
  final List<String> actions;
  final List<String> skills;
  final List<String> atributes;
  final List<String> equipments;
  final List<String> treasures;

  Menace({
    required this.uuid,
    required this.name,
    required this.nd,
    required this.type,
    required this.creatureSize,
    required this.combatRole,
    required this.initiative,
    required this.perception,
    required this.defense,
    required this.resistences,
    required this.life,
    required this.mana,
    required this.displacement,
    required this.actions,
    required this.skills,
    required this.atributes,
    required this.equipments,
    required this.treasures,
    required this.vision,
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
      other.resistences == resistences &&
      other.mana == mana &&
      other.life == life &&
      other.actions == actions &&
      other.skills == skills &&
      other.atributes == atributes &&
      other.equipments == equipments &&
      other.treasures == treasures &&
      other.vision == vision;

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
      resistences.hashCode ^
      mana.hashCode ^
      life.hashCode ^
      actions.hashCode ^
      skills.hashCode ^
      atributes.hashCode ^
      equipments.hashCode ^
      treasures.hashCode ^
      vision.hashCode;
}

// básicos pra salvar de uma ameaça é o nome e ND, tipo e tamanho, papel de combate, 
// iniciativa e percepção, defesa e resistência, pontos de vida e mana, deslocamento, 
// ações, perícias, atributos, equipamentos e tesouro.