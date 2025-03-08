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

abstract class BoardAdapters {
  static BoardTableCompanion toCompanion(Board entity) {
    return BoardTableCompanion(
      uuid: Value<String>(entity.uuid),
      name: Value<String>(entity.name),
      level: Value<int>(entity.level),
      modeIndex: Value<int>(entity.mode.index),
      adventureName: Value<String>(entity.adventureName),
      bannerPath: Value<String?>(entity.bannerPath),
      desc: Value<String?>(entity.desc),
      createdAt: Value<DateTime>(entity.createdAt),
      updatedAt: Value<DateTime>(entity.updatedAt),
      whatsGroupLink: Value<String?>(entity.whatsGroupLink),
      telegramGroupLink: Value<String?>(entity.telegramGroupLink),
      discordServerLink: Value<String?>(entity.discordServerLink),
      driveFilesLink: Value<String?>(entity.driveFilesLink),
      isFavorited: Value<bool>(entity.isFavorited),
    );
  }

  static Board fromDriftDto(BoardDriftDto dto) {
    final links = dto.linksData.map(BoardLinkAdapters.fromDriftData).toList();
    final players =
        dto.playersData.map(BoardPlayerAdapters.fromDriftDto).toList();
    final materials =
        dto.materialsData.map(BoardMaterialsAdapters.fromDriftData).toList();
    final notes = dto.notesData.map(BoardNoteAdapters.fromDriftData).toList();
    final sessions =
        dto.sessionsData.map(BoardSessionAdapters.fromDriftData).toList();
    final combats =
        dto.combatsData.map(BoardCombatAdapters.fromDriftData).toList();
    return Board(
      uuid: dto.boardData.uuid,
      adventureName: dto.boardData.adventureName,
      name: dto.boardData.name,
      createdAt: dto.boardData.createdAt,
      updatedAt: dto.boardData.updatedAt,
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
      menaces: [],
      menacesLinkToBoard: [],
      characters: [],
      sessions: sessions,
    );
  }
}
