import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class GrimorieStorageService extends DriftStorageService {
  Future<Failure?> deleteGrimoire(Grimoire entity) {
    return super.dataBase.grimoireDAO.deleteGrimoire(entity);
  }

  Future<({Failure? failure, Stream<List<Grimoire>>? grimoires})>
      watchAllGrimoire(String grimoireUuid) {
    return super.dataBase.grimoireDAO.watchAllGrimoire(grimoireUuid);
  }

  Future<Failure?> insertGrimoire(Grimoire entity) {
    return super.dataBase.grimoireDAO.insertGrimoire(entity);
  }

  Future<Failure?> insertMagic(MagicCharacter entity) {
    return super.dataBase.magicCharacterDAO.insertMagic(entity);
  }

  Future<Failure?> deleteMagic(MagicCharacter entity) {
    return super.dataBase.magicCharacterDAO.deleteMagic(entity);
  }
}
