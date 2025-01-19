class BoardGamePause {
  final String uuid;
  final String boardGameUuid;
  final DateTime startedAt;
  final DateTime? endAt;

  BoardGamePause({
    required this.uuid,
    required this.boardGameUuid,
    required this.startedAt,
    required this.endAt,
  });

  @override
  bool operator ==(other) =>
      other is BoardGamePause &&
      other.uuid == uuid &&
      other.boardGameUuid == boardGameUuid &&
      other.startedAt == startedAt &&
      other.endAt == endAt;

  @override
  int get hashCode =>
      uuid.hashCode ^
      boardGameUuid.hashCode ^
      startedAt.hashCode ^
      endAt.hashCode;
}
