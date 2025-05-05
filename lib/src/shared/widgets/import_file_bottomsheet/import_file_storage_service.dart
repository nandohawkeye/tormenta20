import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class ImportFileStorageService extends DriftStorageService {
  Future<Failure?> saveBoard({
    required Board board,
    required List<String> materialsToDelete,
    required List<String> linksToDelete,
  }) {
    return super.dataBase.boardDAO.saveBoard(
          entity: board,
          materialsToDelete: materialsToDelete,
          linksToDelete: linksToDelete,
        );
  }

  Future<({List<Board>? boards, Failure? failure})> getBoards() async {
    return super.dataBase.boardDAO.getBoardsForMaster();
  }
}
