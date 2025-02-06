import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_material_types.dart';

abstract class BoardMaterialsAdapters {
  static BoardMaterialTableCompanion toCompanion(BoardMaterial entity) {
    return BoardMaterialTableCompanion(
      uuid: Value<String>(entity.uuid),
      path: Value<String>(entity.path),
      boardUuid: Value<String>(entity.boardUuid),
      typeIndex: Value<int>(entity.type.index),
    );
  }

  static BoardMaterial fromDriftData(BoardMaterialTableData data) {
    return BoardMaterial(
      uuid: data.uuid,
      type: BoardMaterialTypes.values[data.typeIndex],
      path: data.path,
      boardUuid: data.boardUuid,
    );
  }
}
