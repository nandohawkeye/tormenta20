import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';

class BoardPlayer {
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
  final int life;
  final int mana;
  final int defense;
  final bool isAlive;
  final int initiative;

  const BoardPlayer({
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
    required this.isAlive,
    required this.initiative,
  });

  BoardPlayer copyWithChangeAlive({required bool isAlive}) {
    return BoardPlayer(
      playerName: playerName,
      imagePath: imagePath,
      imageAsset: imageAsset,
      uuid: uuid,
      boardUuid: boardUuid,
      characterName: characterName,
      brood: brood,
      classes: classes,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      life: life,
      mana: mana,
      defense: defense,
      isAlive: isAlive,
      initiative: initiative,
    );
  }

  @override
  bool operator ==(other) =>
      other is BoardPlayer &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.updatedAt == updatedAt &&
      other.createdAt == createdAt;

  @override
  int get hashCode =>
      uuid.hashCode ^
      boardUuid.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
