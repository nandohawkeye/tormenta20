class BoardLink {
  final String uuid;
  final String link;
  final String boardUuid;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BoardLink({
    required this.uuid,
    required this.link,
    required this.boardUuid,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  bool operator ==(other) =>
      other is BoardLink &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      uuid.hashCode ^
      boardUuid.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
