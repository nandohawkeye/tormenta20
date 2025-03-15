import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class BoardSessionsStorageService extends DriftStorageService {
  Future<Failure?> saveSession(BoardSession session) {
    return super.dataBase.boardDAO.saveSession(session);
  }

  Future<Failure?> saveCombat(BoardCombat combat) {
    return super.dataBase.boardDAO.saveCombat(combat);
  }

  Future<({Failure? failure, Stream<List<BoardSession>>? sessions})>
      watchSessions(String boardUuid) {
    return super.dataBase.boardDAO.watchSessions(boardUuid);
  }
}
