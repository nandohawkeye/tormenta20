import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class BoardViewLinksStorageService extends DriftStorageService {
  Future<({Failure? failure, Stream<List<BoardLink>>? links})> watchLinks(
      String boardUuid) {
    return super.dataBase.boardDAO.watchLinks(boardUuid);
  }

  Future<Failure?> saveLink(BoardLink link) {
    return super.dataBase.boardDAO.saveLink(link);
  }

  Future<Failure?> deleteLink(BoardLink link) {
    return super.dataBase.boardDAO.deleteLink(link);
  }
}
