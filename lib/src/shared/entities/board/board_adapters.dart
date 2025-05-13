import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_dto.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/entities/board/board_link_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_materials_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';
import 'package:tormenta20/src/shared/entities/board/board_note_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/entities/board/board_player_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_adapters.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/entities/character_board_adapters.dart';
import 'package:tormenta20/src/shared/entities/export_import_type.dart';
import 'package:tormenta20/src/shared/entities/menace_adapters.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board_adapters.dart';
import 'package:tormenta20/src/shared/utils/export_import_utils.dart';
import 'package:uuid/uuid.dart';

abstract class BoardAdapters {
  static BoardTableCompanion toCompanion(Board entity) {
    return BoardTableCompanion(
      uuid: Value<String>(entity.uuid),
      name: Value<String>(entity.name),
      level: Value<int>(entity.level ?? 1),
      modeIndex: Value<int>(entity.mode.index),
      adventureName: Value<String>(entity.adventureName),
      bannerPath: Value<String?>(entity.bannerPath),
      desc: Value<String?>(entity.desc),
      createdAt: Value<int>(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value<int>(entity.updatedAt.millisecondsSinceEpoch),
      whatsGroupLink: Value<String?>(entity.whatsGroupLink),
      telegramGroupLink: Value<String?>(entity.telegramGroupLink),
      discordServerLink: Value<String?>(entity.discordServerLink),
      driveFilesLink: Value<String?>(entity.driveFilesLink),
      isFavorited: Value<bool>(entity.isFavorited),
    );
  }

  static Board fromDriftData(BoardTableData data) {
    return Board(
      uuid: data.uuid,
      adventureName: data.adventureName,
      name: data.name,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
      level: data.level,
      mode: BoardModeType.values[data.modeIndex],
      isFavorited: data.isFavorited,
      bannerPath: data.bannerPath,
      desc: data.desc,
      whatsGroupLink: data.whatsGroupLink,
      telegramGroupLink: data.telegramGroupLink,
      discordServerLink: data.discordServerLink,
      driveFilesLink: data.driveFilesLink,
      links: [],
      players: [],
      materials: [],
      notes: [],
      combats: [],
      menaces: [],
      menacesLinkToBoard: [],
      characters: [],
      sessions: [],
    );
  }

  static Board fromDriftDto(BoardDriftDto dto) {
    final links = dto.linksData.map(BoardLinkAdapters.fromDriftData).toList();
    final players =
        dto.playersData.map(BoardPlayerAdapters.fromDriftData).toList();
    final materials =
        dto.materialsData.map(BoardMaterialsAdapters.fromDriftData).toList();
    final notes = dto.notesData.map(BoardNoteAdapters.fromDriftData).toList();
    final sessions =
        dto.sessionsData.map(BoardSessionAdapters.fromDriftData).toList();
    final combats =
        dto.combatsData.map(BoardCombatAdapters.fromDriftData).toList();
    final linkMenaces =
        dto.linkMenaceData.map(MenaceLinkBoardAdapters.fromDriftData).toList();
    final menaces = dto.menaceData.map(MenaceAdapters.fromDriftData).toList();

    List<CharacterBoard> characters = [];

    for (var character in dto.characterData) {
      final characterBoard = CharacterBoardAdapters.fromDriftData(
          character,
          dto.classesData
              .where((e) => e.characterUuid == character.uuid)
              .toList());
      characters.add(characterBoard);
    }

    return Board(
      uuid: dto.boardData.uuid,
      adventureName: dto.boardData.adventureName,
      name: dto.boardData.name,
      createdAt: DateTime.fromMillisecondsSinceEpoch(dto.boardData.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(dto.boardData.updatedAt),
      level: dto.boardData.level,
      mode: BoardModeType.values[dto.boardData.modeIndex],
      isFavorited: dto.boardData.isFavorited,
      bannerPath: dto.boardData.bannerPath,
      desc: dto.boardData.desc,
      whatsGroupLink: dto.boardData.whatsGroupLink,
      telegramGroupLink: dto.boardData.telegramGroupLink,
      discordServerLink: dto.boardData.discordServerLink,
      driveFilesLink: dto.boardData.driveFilesLink,
      links: links,
      players: players,
      materials: materials,
      notes: notes,
      combats: combats,
      menaces: menaces,
      menacesLinkToBoard: linkMenaces,
      characters: characters,
      sessions: sessions,
    );
  }

  static Board fronJson(Map<String, dynamic> data) {
    String uuid = data['uuid'] ?? const Uuid().v4();
    final now = DateTime.now();
    List<BoardLink> links = [];
    List<BoardPlayer> players = [];
    List<BoardNote> notes = [];
    List<BoardCombat> combats = [];
    List<BoardSession> sessions = [];
    List<MenaceLinkBoard> menacesLinkToBoard = [];
    if (data.containsKey('links') && (data['links'] as List).isNotEmpty) {
      links.addAll((data['links'] as List)
          .map((link) => BoardLinkAdapters.fromJson(link, uuid)));
    }

    if (data.containsKey('players')) {
      players.addAll((data['players'] as List)
          .map((player) => BoardPlayerAdapters.fromJson(player)));
    }

    if (data.containsKey('notes')) {
      notes.addAll((data['notes'] as List)
          .map((note) => BoardNoteAdapters.fromJson(note)));
    }

    if (data.containsKey('combats')) {
      combats.addAll((data['combats'] as List)
          .map((combat) => BoardCombatAdapters.fromJson(combat)));
    }

    if (data.containsKey('sessions')) {
      sessions.addAll((data['sessions'] as List)
          .map((session) => BoardSessionAdapters.fromJson(session)));
    }

    if (data.containsKey('menace_links')) {
      menacesLinkToBoard.addAll((data['menace_links'] as List)
          .map((menaceLink) => MenaceLinkBoardAdapters.fromJson(menaceLink)));
    }

    final board = Board(
      uuid: uuid,
      adventureName: data['adventure_name'],
      name: data['name'],
      createdAt: DateTime.tryParse(data['created_at'] ?? '') ?? now,
      updatedAt: DateTime.tryParse(data['updated_at'] ?? '') ?? now,
      level: data['level'],
      mode: BoardModeType.values[data['mode_index'] ?? 0],
      isFavorited: data['is_favorited'],
      bannerPath: null,
      desc: data['desc'],
      whatsGroupLink: data['whats'],
      telegramGroupLink: data['telegram'],
      discordServerLink: data['discord'],
      driveFilesLink: data['drive'],
      links: links,
      players: players,
      notes: notes,
      combats: combats,
      sessions: sessions,
      menacesLinkToBoard: menacesLinkToBoard,
      characters: [],
      menaces: [],
      materials: [],
    );

    return board;
  }

  static Map<String, dynamic>? toExportPlayer(Board entity) {
    try {
      var base = ExportImportUtils.toExportBase(ExportImportType.binding);

      if (base == null) return null;

      Map<String, dynamic> boardData = {
        'name': entity.name,
        'adventure_name': entity.adventureName,
        'level': entity.level ?? 1,
        'mode_index': BoardModeType.player.index,
        'is_favorited': false,
      };

      if (entity.desc?.isNotEmpty ?? false) {
        boardData.addAll({'desc': entity.desc});
      }

      if (entity.whatsGroupLink?.isNotEmpty ?? false) {
        boardData.addAll({'whats': entity.whatsGroupLink});
      }

      if (entity.telegramGroupLink?.isNotEmpty ?? false) {
        boardData.addAll({'telegram': entity.telegramGroupLink});
      }

      if (entity.discordServerLink?.isNotEmpty ?? false) {
        boardData.addAll({'discord': entity.discordServerLink});
      }

      if (entity.driveFilesLink?.isNotEmpty ?? false) {
        boardData.addAll({'drive': entity.driveFilesLink});
      }

      if (entity.links.isNotEmpty) {
        boardData.addAll(
            {'links': entity.links.map(BoardLinkAdapters.toJson).toList()});
      }

      base.addAll({'board': boardData});

      return base;
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }

      return null;
    }
  }
}
