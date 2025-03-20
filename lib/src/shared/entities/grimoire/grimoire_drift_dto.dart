import 'package:tormenta20/src/core/database/app_database.dart';

class GrimoireDriftDto {
  final GrimoireTableData grimoireData;
  List<MagicCharacterTableData> magicsData = [];
  List<CharacterTableData> charactersData = [];

  GrimoireDriftDto({required this.grimoireData});
}
