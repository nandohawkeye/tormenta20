import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class GrimoriesStorageService extends DriftStorageService {
  Future<({Failure? failure, List<Grimoire> grimoires})> getAllGrimoires() {
    return super.dataBase.grimoireDAO.getAllGrimoires();
  }

  Future<({Failure? failure, Stream<List<Grimoire>>? grimoires})>
      watchAllGrimoires() {
    return super.dataBase.grimoireDAO.watchAllGrimoires();
  }

  Future<Failure?> insertGrimoire(Grimoire entity) {
    return super.dataBase.grimoireDAO.insertGrimoire(entity);
  }
}
