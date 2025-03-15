import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class BoardCombatStorageService extends DriftStorageService {
  Future<Failure?> saveCombate(BoardCombat combat) {
    return super.dataBase.boardDAO.saveCombat(combat);
  }
}
