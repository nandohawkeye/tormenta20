import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class BoardViewStorageService extends DriftStorageService {
  Future<Failure?> saveSession(BoardSession session) {
    return super.dataBase.boardDAO.saveSession(session);
  }

  Future<Failure?> saveCombat(BoardCombat combat) {
    return super.dataBase.boardDAO.saveCombat(combat);
  }

  Future<({Stream<Board?>? boards, Failure? failure})> watchSingleBoard(
      String uuid) {
    return super.dataBase.boardDAO.watchSingleBoard(uuid);
  }

  Future<Failure?> deleteBoard(Board board) {
    return super.dataBase.boardDAO.deleteBoard(board);
  }

  Future<Failure?> saveBoardPlayer(BoardPlayer player) {
    return super.dataBase.boardDAO.saveBoardPlayer(player);
  }

  Future<Failure?> deleteBoardPlayer(BoardPlayer player) {
    return super.dataBase.boardDAO.deleteBoardPlayer(player);
  }

  Future<Failure?> saveBoardCharacter(CharacterBoard character) {
    return super.dataBase.characterDAO.saveBoardCharacter(character);
  }

  Future<Failure?> deleteBoardCharacter(CharacterBoard character) {
    return super.dataBase.boardDAO.deleteBoardCharacter(character);
  }
}
