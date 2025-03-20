import 'package:tormenta20/src/core/database/app_database.dart';

class CharacterDto {
  final CharacterTableData data;
  late ClasseCharacterTableData classe;
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

  List<CharacterBoardTableData> characterBoardsData = [];

  CharacterDto(this.data);
}
