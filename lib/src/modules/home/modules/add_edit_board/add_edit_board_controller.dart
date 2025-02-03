import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_character.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcuts_dto.dart';

class AddEditBoardController {
  AddEditBoardController(Board? initialBoard) {
    if (initialBoard != null) {
      _uuid = initialBoard.uuid;
      _name = initialBoard.name;
      _desc = initialBoard.desc;
      _adventure = initialBoard.adventureName;
      _level = initialBoard.level;
      _bannerPath = initialBoard.bannerPath;
      _whatsLink = initialBoard.whatsGroupLink;
      _dicordLink = initialBoard.discordServerLink;
      _drivefilesLink = initialBoard.driveFilesLink;
      _telegramLink = initialBoard.telegramGroupLink;
      _materials.addAll(initialBoard.materials);
      _links.addAll(initialBoard.links);
      _characters.addAll(initialBoard.characters);
      _mode = initialBoard.mode;
    }
  }

  BoardModeType _mode = BoardModeType.master;

  String? _uuid;

  String? _name;
  String? get name => _name;
  void changeName(String? value) => _name = value;

  String? _adventure;
  String? get adventure => _adventure;
  void changeAdventure(String? value) => _adventure = value;

  String? _desc;
  String? get desc => _desc;
  void changeDesc(String? value) => _desc = value;

  int? _level = 1;
  int? get level => _level;
  void changeLevel(String? value) {
    if ((value ?? '').isEmpty) {
      _level = null;
    } else {
      _level = int.parse(value!);
    }
  }

  String? _bannerPath;
  String? get bannerPath => _bannerPath;
  void changeBannerPath(String? value) => _bannerPath = value;

  String? _whatsLink;
  String? get whatsLink => _whatsLink;

  String? _dicordLink;
  String? get dicordLink => _dicordLink;

  String? _drivefilesLink;
  String? get drivefilesLink => _drivefilesLink;

  String? _telegramLink;
  String? get telegramLink => _telegramLink;

  List<BoardMaterial> _materials = [];
  List<BoardMaterial> get materials => _materials;

  List<BoardLink> _links = [];
  List<BoardLink> get links => _links;

  List<BoardCharacter> _characters = [];
  List<BoardCharacter> get characters => _characters;

  void onChangeShortcuts(BoardShortcutsDto? dto) {
    if (dto != null) {
      _whatsLink = dto.whatsLink;
      _dicordLink = dto.dicordLink;
      _drivefilesLink = dto.drivefilesLink;
      _telegramLink = dto.telegramLink;
    }
  }
}
