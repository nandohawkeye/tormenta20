import 'package:tormenta20/src/shared/entities/board/board_note.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class BoardNoteStorageService extends DriftStorageService {
  Future<Failure?> saveNote(BoardNote note) {
    return super.dataBase.boardDAO.saveNote(note);
  }

  Future<Failure?> deleteNote(BoardNote note) {
    return super.dataBase.boardDAO.deleteNote(note);
  }

  Future<({Failure? failure, Stream<List<BoardNote>>? notes})> watchNotes(
      String boardUuid) {
    return super.dataBase.boardDAO.watchNotes(boardUuid);
  }
}
