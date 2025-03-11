import 'package:tormenta20/src/core/database/app_database.dart';

class MenaceDriftDto {
  final MenaceTableData data;
  List<MagicMenaceTableData> magics = [];

  List<ActionTableData> actions = [];
  List<ActionHandToHandTableData> handToHands = [];
  List<ActionDistanceAttackTableData> attackDistances = [];

  List<ExpertiseTableData> expertises = [];
  List<GeneralSkillTableData> generalSkills = [];
  List<MenaceLinkBoardTableData> boardsLinkeds = [];
  List<BoardTableData> boards = [];

  List<EquipmentTableData> equipments = [];
  List<AdventureBackpackTableData> adventureBackpacks = [];
  List<BackpackTableData> backpacks = [];
  List<AmmunitionTableData> ammunitions = [];
  List<ArmorTableData> armors = [];
  List<GeneralItemTableData> generalItens = [];
  List<SaddlebagTableData> saddlebags = [];
  List<ShieldTableData> shields = [];
  List<WeaponTableData> weapons = [];

  MenaceDriftDto(this.data);
}
