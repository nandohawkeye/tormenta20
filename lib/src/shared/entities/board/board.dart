import 'package:tormenta20/src/shared/entities/board/board_character.dart';
import 'package:tormenta20/src/shared/entities/board/board_game.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';

class Board {
  final String uuid;
  final String name;
  final String? bannerPath;
  final String adventureName;
  final String? desc;
  final int level;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<BoardMaterial> materials;
  final List<BoardLink> links;
  final List<BoardGame> games;
  final List<BoardCharacter> characters;
  final BoardModeType mode;

  final String? whatsGroupLink;
  final String? telegramGroupLink;
  final String? discordServerLink;
  final String? driveFilesLink;

  Board({
    required this.uuid,
    this.bannerPath,
    this.desc,
    required this.adventureName,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.materials,
    required this.links,
    required this.games,
    required this.level,
    required this.characters,
    required this.mode,
    this.whatsGroupLink,
    this.telegramGroupLink,
    this.discordServerLink,
    this.driveFilesLink,
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
      other.games == games &&
      other.characters == characters &&
      other.level == level &&
      other.updatedAt == updatedAt &&
      other.mode == mode &&
      other.whatsGroupLink == whatsGroupLink &&
      other.telegramGroupLink == telegramGroupLink &&
      other.discordServerLink == discordServerLink &&
      other.driveFilesLink == driveFilesLink;

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
      games.hashCode ^
      characters.hashCode ^
      level.hashCode ^
      mode.hashCode ^
      whatsGroupLink.hashCode ^
      telegramGroupLink.hashCode ^
      discordServerLink.hashCode ^
      driveFilesLink.hashCode;
}
