import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character_classe.dart';

class BoardPlayer {
  final String playerName;
  final String? imagePath;
  final String? imageAsset;
  final String uuid;
  final String boardUuid;
  final String characterName;
  final Brood brood;
  final List<CharacterClasse> classes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int life;
  final int mana;
  final int defense;

  BoardPlayer({
    this.imagePath,
    this.imageAsset,
    required this.playerName,
    required this.uuid,
    required this.boardUuid,
    required this.characterName,
    required this.brood,
    required this.createdAt,
    required this.updatedAt,
    required this.classes,
    required this.life,
    required this.mana,
    required this.defense,
  });

  @override
  bool operator ==(other) =>
      other is BoardPlayer &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.playerName == playerName &&
      other.imagePath == imagePath &&
      other.characterName == characterName &&
      other.brood == brood &&
      other.updatedAt == updatedAt &&
      other.createdAt == createdAt &&
      other.imageAsset == imageAsset &&
      other.classes == classes &&
      other.life == life &&
      other.mana == mana &&
      other.defense == defense;

  @override
  int get hashCode =>
      uuid.hashCode ^
      boardUuid.hashCode ^
      playerName.hashCode ^
      imagePath.hashCode ^
      characterName.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      brood.hashCode ^
      imageAsset.hashCode ^
      classes.hashCode ^
      life.hashCode ^
      mana.hashCode ^
      defense.hashCode;
}
