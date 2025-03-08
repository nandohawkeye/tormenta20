import 'package:tormenta20/src/core/database/app_database.dart';

class MenaceDriftDto {
  final MenaceTableData data;
  List<MagicMenaceTableData> magics = [];
  List<ActionTableData> actions = [];
  List<EquipmentTableData> equipments = [];
  List<ExpertiseTableData> expertises = [];
  List<GeneralSkillTableData> generalSkills = [];

  MenaceDriftDto(this.data);
}
