// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';

class BoardNotesStore extends ChangeNotifier {
  BoardNotesStore(String boardUuid) {
    _initWatch(boardUuid);
  }

  StreamSubscription? _subscription;

  void _initWatch(String boardUuid) async {
    await GetIt.I<AppDatabase>().boardDAO.watchNotes(boardUuid).then((resp) {
      if (resp.notes != null) {
        _subscription ?? resp.notes?.listen(_setNotes);
      }
    });
  }

  List<BoardNote> _notes = [];
  List<BoardNote> get notes {
    if (_onliFavoriteds) {
      return _notes.where((note) => note.isFavorited).toList();
    }

    return _notes;
  }

  void _setNotes(List<BoardNote> data) {
    _notes.clear();
    _notes.addAll(data);
    notifyListeners();
  }

  bool _onliFavoriteds = false;
  bool get onliFavoriteds => _onliFavoriteds;
  void changeOnlyFavorited() {
    _onliFavoriteds = !_onliFavoriteds;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    super.dispose();
  }
}
