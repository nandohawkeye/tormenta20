class BoardNote {
  final String uuid;
  final String note;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String boardUuid;
  final bool isFavotited;

  BoardNote({
    required this.uuid,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.boardUuid,
    required this.isFavotited,
  });

  @override
  bool operator ==(other) =>
      other is BoardNote &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.note == note &&
      other.isFavotited == isFavotited &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      uuid.hashCode ^
      boardUuid.hashCode ^
      note.hashCode ^
      isFavotited.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
