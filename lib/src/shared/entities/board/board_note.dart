class BoardNote {
  final String uuid;
  final String note;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String boardUuid;
  final bool isFavorited;

  BoardNote({
    required this.uuid,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.boardUuid,
    required this.isFavorited,
  });

  @override
  bool operator ==(other) =>
      other is BoardNote &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.note == note &&
      other.isFavorited == isFavorited &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      uuid.hashCode ^
      boardUuid.hashCode ^
      note.hashCode ^
      isFavorited.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
