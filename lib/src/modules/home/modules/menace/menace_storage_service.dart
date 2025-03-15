import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class MenaceStorageService extends DriftStorageService {
  Future<({Failure? failure, Stream<Menace?>? menace})> watchMenace(
      String uuid) {
    return super.dataBase.menaceDAO.watchMenace(uuid);
  }

  Future<({Stream<List<Board>>? boards, Failure? failure})>
      watchBoardsWithLinkMenace() {
    return super.dataBase.boardDAO.watchBoardsWithLinkMenace();
  }

  Future<Failure?> addLinkMenaceBoard({required MenaceLinkBoard entity}) {
    return super.dataBase.menaceDAO.addLinksMenaceBoard(entities: [entity]);
  }

  Future<Failure?> removeLinkMenaceBoard(
      {required String boardUuid, required String menaceUuid}) {
    return super
        .dataBase
        .menaceDAO
        .removeLinkMenaceBoard(boardUuid: boardUuid, menaceUuid: menaceUuid);
  }

  Future<Failure?> deleteMenace({required Menace entity}) {
    return super.dataBase.menaceDAO.deleteMenace(entity: entity);
  }
}
