import 'package:tormenta20/src/modules/home/modules/board_combat/board_combat_storage_service.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';

class BoardCombatStore {
  final _storageService = BoardCombatStorageService();

  Future<void> saveCombat(BoardCombat combat) async {
    await _storageService.saveCombate(combat);
  }
}
