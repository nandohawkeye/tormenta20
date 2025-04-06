import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class SelectCharacterStorageService extends DriftStorageService {
  Future<({Failure? failure, Stream<List<Character>>? characters})>
      wachCharacters() {
    return super.dataBase.characterDAO.watchCharacters();
  }

  // Future<Failure?> addLinkMenaceBoard(
  //     {required List<MenaceLinkBoard> entities}) {
  //   return super.dataBase.menaceDAO.addLinksMenaceBoard(entities: entities);
  // }
}
