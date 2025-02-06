import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_player_dto.dart';

class BoardDriftDto {
  BoardDriftDto({required this.boardData});

  final BoardTableData boardData;
  List<BoardPlayerDto> playersData = [];
  List<BoardLinkTableData> linksData = [];
  List<BoardMaterialTableData> materialsData = [];
}
