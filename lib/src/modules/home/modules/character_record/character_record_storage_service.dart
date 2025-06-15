import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class CharacterRecordStorageService extends DriftStorageService {
  Future<({Failure? failure, Stream<CharacterBoard?>? character})>
  watchCharacter(String uuid) {
    return super.dataBase.characterDAO.watchCharactersBoardFromUuid(uuid);
  }
}
