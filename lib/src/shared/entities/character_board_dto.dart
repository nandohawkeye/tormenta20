import 'package:tormenta20/src/core/database/app_database.dart';

class CharacterBoardDto {
  final CharacterBoardTableData characterBoardsData;
  List<ClasseCharacterTableData> classes = [];
  GrimoireTableData? grimoireData;
  List<OriginTableData> origins = [];
  List<PowerTableData> powers = [];
  List<ActionTableData> actions = [];
  List<ActionHandToHandTableData> handToHands = [];
  List<ActionDistanceAttackTableData> distanceAttacks = [];

  List<EquipmentTableData> equipments = [];
  List<AdventureBackpackTableData> adventureBackpacks = [];
  List<BackpackTableData> backpacks = [];
  List<AmmunitionTableData> ammunitions = [];
  List<ArmorTableData> armors = [];
  List<GeneralItemTableData> generalItens = [];
  List<SaddlebagTableData> saddlebags = [];
  List<ShieldTableData> shields = [];
  List<WeaponTableData> weapons = [];
  TibarsTableData? tibars;

  List<ExpertiseTableData> expertises = [];

  CharacterBoardDto({
    required this.characterBoardsData,
    tibars,
  });
}
