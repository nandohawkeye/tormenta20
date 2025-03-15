import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class InitStorageService extends DriftStorageService {
  Future<({Stream<List<Board>>? boards, Failure? failure})> watchBoards() {
    return super.dataBase.boardDAO.watchBoards();
  }

  Future<({Failure? failure, Stream<List<Menace>>? menaces})> watchMenaces() {
    return super.dataBase.menaceDAO.watchMenaces();
  }
}
