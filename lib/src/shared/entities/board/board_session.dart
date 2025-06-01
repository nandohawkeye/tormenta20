import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/session_environment.dart';

class BoardSession {
  final String uuid;
  final String boardUuid;
  final DateTime startedAt;
  final DateTime? endAt;
  final SessionEnvironment? environment;
  final List<BoardCombat> combats;
  final DateTime updatedAt;

  BoardSession({
    required this.uuid,
    required this.boardUuid,
    required this.startedAt,
    required this.combats,
    required this.updatedAt,
    this.endAt,
    this.environment,
  });

  BoardSession copyWith({
    String? uuid,
    String? boardUuid,
    DateTime? startedAt,
    DateTime? endAt,
    SessionEnvironment? environment,
    DateTime? updatedAt,
  }) {
    return BoardSession(
      uuid: uuid ?? this.uuid,
      boardUuid: boardUuid ?? this.boardUuid,
      startedAt: startedAt ?? this.startedAt,
      endAt: endAt ?? this.endAt,
      combats: combats,
      environment: environment,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  @override
  bool operator ==(other) =>
      other is BoardSession &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.startedAt == startedAt &&
      other.endAt == endAt &&
      other.updatedAt == updatedAt &&
      other.environment == environment;

  @override
  int get hashCode =>
      uuid.hashCode ^
      boardUuid.hashCode ^
      startedAt.hashCode ^
      endAt.hashCode ^
      updatedAt.hashCode ^
      environment.hashCode;
}
