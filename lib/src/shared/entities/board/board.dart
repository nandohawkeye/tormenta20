import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board.dart';

class Board {
  final String uuid;
  final String name;
  final String adventureName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? bannerPath;
  final String? desc;
  final int? level;
  final List<BoardMaterial> materials;
  final List<BoardLink> links;
  final List<BoardSession> sessions;
  final List<BoardCombat> combats;
  final List<BoardPlayer> players;
  final List<CharacterBoard> characters;
  final BoardModeType mode;
  final bool isFavorited;
  final List<BoardNote> notes;
  final List<Menace> menaces;
  final List<MenaceLinkBoard> menacesLinkToBoard;

  final String? whatsGroupLink;
  final String? telegramGroupLink;
  final String? discordServerLink;
  final String? driveFilesLink;

  Board({
    required this.uuid,
    this.bannerPath,
    this.desc,
    this.whatsGroupLink,
    this.telegramGroupLink,
    this.discordServerLink,
    this.driveFilesLink,
    required this.adventureName,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.materials,
    required this.links,
    required this.sessions,
    required this.level,
    required this.players,
    required this.mode,
    required this.isFavorited,
    required this.notes,
    required this.menaces,
    required this.menacesLinkToBoard,
    required this.characters,
    required this.combats,
  });

  @override
  bool operator ==(other) =>
      other is Board &&
      other.uuid == uuid &&
      other.bannerPath == bannerPath &&
      other.desc == desc &&
      other.adventureName == adventureName &&
      other.name == name &&
      other.createdAt == createdAt &&
      other.materials == materials &&
      other.links == links &&
      other.sessions == sessions &&
      other.players == players &&
      other.level == level &&
      other.updatedAt == updatedAt &&
      other.mode == mode &&
      other.whatsGroupLink == whatsGroupLink &&
      other.telegramGroupLink == telegramGroupLink &&
      other.discordServerLink == discordServerLink &&
      other.driveFilesLink == driveFilesLink &&
      other.characters == characters &&
      other.isFavorited == isFavorited &&
      other.notes == notes &&
      other.menaces == menaces &&
      other.combats == combats &&
      other.menacesLinkToBoard == menacesLinkToBoard;

  @override
  int get hashCode =>
      uuid.hashCode ^
      bannerPath.hashCode ^
      desc.hashCode ^
      adventureName.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      materials.hashCode ^
      links.hashCode ^
      sessions.hashCode ^
      players.hashCode ^
      level.hashCode ^
      mode.hashCode ^
      whatsGroupLink.hashCode ^
      telegramGroupLink.hashCode ^
      discordServerLink.hashCode ^
      driveFilesLink.hashCode ^
      characters.hashCode ^
      isFavorited.hashCode ^
      notes.hashCode ^
      menaces.hashCode ^
      combats.hashCode ^
      menacesLinkToBoard.hashCode;
}
