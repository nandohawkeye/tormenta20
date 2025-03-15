import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class SelectMenacesStorageService extends DriftStorageService {
  Future<({Failure? failure, Stream<List<Menace>>? menaces})> watchMenaces() {
    return super.dataBase.menaceDAO.watchMenaces();
  }

  Future<Failure?> addLinkMenaceBoard(
      {required List<MenaceLinkBoard> entities}) {
    return super.dataBase.menaceDAO.addLinksMenaceBoard(entities: entities);
  }
}
