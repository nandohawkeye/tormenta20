class BoardGame {
  final String uuid;
  final String boardUuid;
  final DateTime startedAt;
  final DateTime? endAt;

  BoardGame({
    required this.uuid,
    required this.boardUuid,
    required this.startedAt,
    required this.endAt,
  });

  @override
  bool operator ==(other) =>
      other is BoardGame &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.startedAt == startedAt &&
      other.endAt == endAt;

  @override
  int get hashCode =>
      uuid.hashCode ^ boardUuid.hashCode ^ startedAt.hashCode ^ endAt.hashCode;
}
