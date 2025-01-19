import 'package:tormenta20/src/shared/entities/board/board_material_types.dart';

class BoardMaterial {
  final String uuid;
  final BoardMaterialTypes type;
  final String path;
  final String boardUuid;

  BoardMaterial({
    required this.uuid,
    required this.type,
    required this.path,
    required this.boardUuid,
  });

  @override
  bool operator ==(other) =>
      other is BoardMaterial &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.path == path &&
      other.type == type;

  @override
  int get hashCode =>
      uuid.hashCode ^ boardUuid.hashCode ^ path.hashCode ^ type.hashCode;
}
