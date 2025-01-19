import 'package:tormenta20/src/shared/entities/board/board_link_types.dart';

class BoardLink {
  final String uuid;
  final String link;
  final String boardUuid;
  final BoardLinkType type;

  BoardLink({
    required this.uuid,
    required this.link,
    required this.boardUuid,
    required this.type,
  });

  @override
  bool operator ==(other) =>
      other is BoardLink &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.link == link &&
      other.type == type;

  @override
  int get hashCode =>
      uuid.hashCode ^ boardUuid.hashCode ^ link.hashCode ^ type.hashCode;
}
