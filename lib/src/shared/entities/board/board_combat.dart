class BoardCombat {
  final String uuid;
  final String boardUuid;
  final String sessionUuid;
  final DateTime startedAt;
  final DateTime? endAt;
  final int turn;

  const BoardCombat({
    required this.uuid,
    required this.boardUuid,
    required this.sessionUuid,
    required this.startedAt,
    required this.turn,
    this.endAt,
  });

  BoardCombat copyWith({
    DateTime? endAt,
    int? turn,
  }) {
    return BoardCombat(
      uuid: uuid,
      boardUuid: boardUuid,
      sessionUuid: sessionUuid,
      startedAt: startedAt,
      endAt: endAt ?? this.endAt,
      turn: turn ?? this.turn,
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
        other.sessionUuid == sessionUuid &&
        other.turn == turn;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        boardUuid.hashCode ^
        startedAt.hashCode ^
        endAt.hashCode ^
        sessionUuid.hashCode ^
        turn.hashCode;
  }
}
