import 'package:tormenta20/src/core/database/app_database.dart';

class BoardSessionDto {
  final BoardSessionTableData data;
  List<BoardCombatTableData> combats = [];

  BoardSessionDto({required this.data});
}
