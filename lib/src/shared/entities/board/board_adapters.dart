import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_dto.dart';
import 'package:tormenta20/src/shared/entities/board/board_link_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_materials_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/entities/board/board_note_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_player_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_adapters.dart';
import 'package:tormenta20/src/shared/entities/menace_adapters.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board_adapters.dart';

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
      characters: [],
      sessions: sessions,
    );
  }
}
