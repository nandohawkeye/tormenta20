class BoardCombat {
  final String uuid;
  final String boardUuid;
  final String sessionUuid;
  final DateTime startedAt;
  final DateTime? endAt;

  BoardCombat({
    required this.uuid,
    required this.boardUuid,
    required this.sessionUuid,
    required this.startedAt,
    this.endAt,
  });

  BoardCombat copyWith({
    DateTime? endAt,
  }) {
    return BoardCombat(
      uuid: uuid,
      boardUuid: boardUuid,
      sessionUuid: sessionUuid,
      startedAt: startedAt,
      endAt: endAt ?? this.endAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoardCombat &&
        other.uuid == uuid &&
        other.boardUuid == boardUuid &&
        other.startedAt == startedAt &&
        other.endAt == endAt &&
        other.sessionUuid == sessionUuid;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        boardUuid.hashCode ^
        startedAt.hashCode ^
        endAt.hashCode ^
        sessionUuid.hashCode;
  }
}
