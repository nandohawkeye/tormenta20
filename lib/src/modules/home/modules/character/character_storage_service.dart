import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class CharacterStorageService extends DriftStorageService {
  Future<({Failure? failure, Stream<Character?>? character})> watchCharacter(
      String uuid) {
    return super.dataBase.characterDAO.watchCharacter(uuid);
  }

  Future<void> deleteCharacter(Character entity) {
    return super.dataBase.characterDAO.deleteCharacter(entity: entity);
  }

  Future<({Stream<List<Board>>? boards, Failure? failure})>
      watchOnlyBoardsToCharacters() {
    return super.dataBase.boardDAO.watchOnlyBoardsToCharacters();
  }
}
