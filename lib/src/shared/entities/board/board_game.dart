import 'package:tormenta20/src/shared/entities/board/board_game_pause.dart';

class BoardGame {
  final String uuid;
  final String boardUuid;
  final DateTime startedAt;
  final DateTime? endAt;
  final List<BoardGamePause> pauses;

  BoardGame({
    required this.uuid,
    required this.boardUuid,
    required this.startedAt,
    required this.endAt,
    required this.pauses,
  });

  @override
  bool operator ==(other) =>
      other is BoardGame &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.startedAt == startedAt &&
      other.endAt == endAt &&
      other.pauses == pauses;

  @override
  int get hashCode =>
      uuid.hashCode ^
      boardUuid.hashCode ^
      startedAt.hashCode ^
      endAt.hashCode ^
      pauses.hashCode;
}
