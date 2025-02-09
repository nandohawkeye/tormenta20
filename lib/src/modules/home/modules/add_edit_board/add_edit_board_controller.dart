// ignore_for_file: prefer_final_fields

import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcuts_dto.dart';
import 'package:uuid/uuid.dart';

class AddEditBoardController {
  AddEditBoardController(Board? initialBoard) {
    if (initialBoard != null) {
      _createdAt = initialBoard.createdAt;
      _isFavorited = initialBoard.isFavorited;
      _boardUuid = initialBoard.uuid;
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
      _mode = initialBoard.mode;
    } else {
      _boardUuid = const Uuid().v4();
      _links.add(BoardLink(
        boardUuid: _boardUuid,
        uuid: const Uuid().v4(),
        title: 'Mapa de Arton',
        link: 'https://mapadearton.fichasdenimb.com.br',
      ));
      _dicordLink = 'https://discord.gg/9DcyWYXR';
    }
  }

  final _dao = GetIt.I<AppDatabase>().boardDAO;

  DateTime? _createdAt;

  BoardModeType _mode = BoardModeType.master;
  bool _isFavorited = false;

  late String _boardUuid;
  String get boardUuid => _boardUuid;

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

  List<String> _materialsToDelete = [];
  List<String> _linksToDelete = [];

  List<BoardMaterial> _materials = [];
  List<BoardMaterial> get materials => _materials;
  void addMaterials(List<BoardMaterial> values) => _materials.addAll(values);
  void removeMaterials(BoardMaterial value) {
    _materials.removeWhere((od) => od.uuid == value.uuid);
    _materialsToDelete.add(value.uuid);
  }

  List<BoardLink> _links = [];
  List<BoardLink> get links => _links;
  void addLink(BoardLink value) {
    if (_links.any((l) => l.uuid == value.uuid)) {
      final index = _links.indexWhere((l) => l.uuid == value.uuid);
      _links[index] = value;
    } else {
      _links.add(value);
    }
  }

  void removeLink(BoardLink value) {
    _links.removeWhere((od) => od.uuid == value.uuid);
    _linksToDelete.add(value.uuid);
  }

  void onChangeShortcuts(BoardShortcutsDto? dto) {
    if (dto != null) {
      _whatsLink = dto.whatsLink;
      _dicordLink = dto.dicordLink;
      _drivefilesLink = dto.drivefilesLink;
      _telegramLink = dto.telegramLink;
    }
  }

  Future<Board?> onSave() async {
    final updatedAt = DateTime.now();
    final board = Board(
      uuid: _boardUuid,
      adventureName: _adventure!,
      name: _name!,
      createdAt: _createdAt ?? updatedAt,
      updatedAt: updatedAt,
      materials: materials,
      links: links,
      level: _level!,
      players: [],
      mode: _mode,
      bannerPath: _bannerPath,
      whatsGroupLink: _whatsLink,
      telegramGroupLink: _telegramLink,
      discordServerLink: _dicordLink,
      driveFilesLink: _drivefilesLink,
      desc: _desc,
      games: [],
      notes: [],
      menaces: [],
      characters: [],
      isFavorited: _isFavorited,
    );

    final failure = await _dao.saveBoard(
      entity: board,
      materialsToDelete: _materialsToDelete,
      linksToDelete: _linksToDelete,
    );

    if (failure == null) {
      return board;
    }

    return null;
  }
}
