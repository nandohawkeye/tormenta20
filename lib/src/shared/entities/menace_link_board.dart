import 'package:tormenta20/src/shared/entities/entity_base.dart';

class MenaceLinkBoard extends EntityBase {
  final String uuid;
  final String menaceUuid;
  final String boardUuid;

  MenaceLinkBoard({
    required this.uuid,
    required this.menaceUuid,
    required this.boardUuid,
  });

  @override
  bool operator ==(other) =>
      other is MenaceLinkBoard &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.menaceUuid == menaceUuid;

  @override
  int get hashCode => uuid.hashCode ^ boardUuid.hashCode ^ menaceUuid.hashCode;

  @override
  String get exibitionLabel => 'menace link board';

  @override
  get primaryKey => uuid;
}
