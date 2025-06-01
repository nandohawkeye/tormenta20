import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board.dart';
import 'package:tormenta20/src/shared/entities/menace_type.dart';
import 'package:tormenta20/src/shared/entities/treasure_type.dart';

class Menace extends EntityBase {
  final String name;
  final String nd;
  final String uuid;
  final int initiative;
  final int defense;
  final int life;
  final int mana;
  final MenaceType type;
  final CreatureSizeCategory creatureSize;
  final CombatRole combatRole;
  final String? imagePath;
  final String? imageAsset;
  final String? displacement;
  final int? perception;
  final int? fortResistence;
  final int? refResistence;
  final int? vonResistence;
  final int? strength;
  final int? dexterity;
  final int? constitution;
  final int? intelligence;
  final int? wisdom;
  final int? charisma;
  final int? divinityId;
  final String? desc;
  //na mecanica de rolagem, rolar um d100 pra dinheiro e item
  final TreasureType? treasures;
  final String? senses;
  final String? casterInfos;
  final String? extraInfos;
  final List<Expertise> expertises;
  final List<ActionEnt> actions;
  final List<GeneralSkill> generalSkills;
  final List<MagicMenace> magics;
  final List<Equipment> equipments;
  final List<MenaceLinkBoard> boardsLinkeds;
  final List<Board> boards;
  final DateTime createdAt;
  final DateTime updatedAt;

  Menace cloneWith({
    required String? imagePath,
    required String? imageAsset,
    required String name,
    required String uuid,
    required List<MagicMenace> magics,
    required List<ActionEnt> actions,
    required List<Equipment> equipments,
    required List<GeneralSkill> generalSkills,
    required List<Expertise> expertises,
  }) {
    final createdAt = DateTime.now();
    return Menace(
      uuid: uuid,
      name: name,
      createdAt: createdAt,
      updatedAt: createdAt,
      imagePath: imagePath,
      imageAsset: imageAsset,
      magics: magics,
      actions: actions,
      equipments: equipments,
      generalSkills: generalSkills,
      expertises: expertises,
      displacement: displacement,
      desc: desc,
      extraInfos: extraInfos,
      divinityId: divinityId,
      casterInfos: casterInfos,
      treasures: treasures,
      nd: nd,
      type: type,
      creatureSize: creatureSize,
      combatRole: combatRole,
      initiative: initiative,
      perception: perception,
      defense: defense,
      life: life,
      mana: mana,
      senses: senses,
      fortResistence: fortResistence,
      refResistence: refResistence,
      vonResistence: vonResistence,
      strength: strength,
      charisma: charisma,
      constitution: constitution,
      dexterity: dexterity,
      intelligence: intelligence,
      wisdom: wisdom,
      boardsLinkeds: [],
      boards: [],
    );
  }

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
    required this.boardsLinkeds,
    required this.boards,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  bool operator ==(other) =>
      other is Menace &&
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
