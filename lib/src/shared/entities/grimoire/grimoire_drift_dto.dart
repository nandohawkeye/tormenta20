import 'package:tormenta20/src/core/database/app_database.dart';

class GrimoireDriftDto {
  final GrimoireTableData grimoireData;
  List<MagicCharacterTableData> magicsData = [];

  GrimoireDriftDto({required this.grimoireData});
}
