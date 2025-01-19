class BoardCharacter {
  final String? playerName;
  final String? imagePath;
  final String uuid;
  final String boardGameUuid;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  BoardCharacter({
    this.playerName,
    this.imagePath,
    required this.uuid,
    required this.boardGameUuid,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  bool operator ==(other) =>
      other is BoardCharacter &&
      other.uuid == uuid &&
      other.boardGameUuid == boardGameUuid &&
      other.playerName == playerName &&
      other.imagePath == imagePath &&
      other.name == name &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      uuid.hashCode ^
      boardGameUuid.hashCode ^
      playerName.hashCode ^
      imagePath.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
