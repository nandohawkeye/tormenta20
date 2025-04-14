import 'package:tormenta20/src/core/database/app_database.dart';

class BoardDriftDto {
  BoardDriftDto({required this.boardData});

  final BoardTableData boardData;
  List<BoardPlayerTableData> playersData = [];
  List<BoardLinkTableData> linksData = [];
  List<BoardMaterialTableData> materialsData = [];
  List<BoardNoteTableData> notesData = [];
  List<BoardSessionTableData> sessionsData = [];
  List<BoardCombatTableData> combatsData = [];
  List<MenaceLinkBoardTableData> linkMenaceData = [];
  List<MenaceTableData> menaceData = [];
  List<CharacterBoardTableData> characterData = [];
}
