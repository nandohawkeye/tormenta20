import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';

class BoardCharacter {
  final String playerName;
  final String? imagePath;
  final String? imageAsset;
  final String uuid;
  final String boardUuid;
  final String characterName;
  final Brood brood;
  final List<ClasseType> classes;
  final DateTime createdAt;
  final DateTime updatedAt;

  BoardCharacter({
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
  });

  @override
  bool operator ==(other) =>
      other is BoardCharacter &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.playerName == playerName &&
      other.imagePath == imagePath &&
      other.characterName == characterName &&
      other.brood == brood &&
      other.updatedAt == updatedAt &&
      other.updatedAt == updatedAt &&
      other.imageAsset == imageAsset &&
      other.classes == classes;

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
      classes.hashCode;
}
