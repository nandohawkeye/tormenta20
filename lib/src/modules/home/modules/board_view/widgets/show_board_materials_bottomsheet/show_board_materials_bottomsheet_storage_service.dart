import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class ShowBoardMaterialsBottomsheetStorageService extends DriftStorageService {
  Future<({Failure? failure, Stream<List<BoardMaterial>>? materials})>
      watchMaterials(String boardUuid) {
    return super.dataBase.boardDAO.watchMaterials(boardUuid);
  }

  Future<Failure?> saveMaterials(List<BoardMaterial> materials) {
    return super.dataBase.boardDAO.saveMaterials(materials);
  }

  Future<Failure?> deleteMaterials(List<String> uuids) {
    return super.dataBase.boardDAO.deleteMaterials(uuids);
  }
}
