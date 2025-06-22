import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class SelectCharacterStorageService extends DriftStorageService {
  Future<({Failure? failure, Stream<List<Character>>? characters})>
  wachCharacters() {
    return super.dataBase.characterDAO.watchCharacters();
  }

  Future<({Character? character, Failure? failure})> getCharacter(
    Character character,
  ) {
    return super.dataBase.characterDAO.getCharacter(character.uuid);
  }

  Future<Failure?> saveCharacterBoard(CharacterBoard character) {
    return super.dataBase.characterDAO.saveBoardCharacter(character);
  }
}
