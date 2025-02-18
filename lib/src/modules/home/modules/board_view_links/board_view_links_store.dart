// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';

class BoardLinksStore extends ChangeNotifier {
  BoardLinksStore(String boardUuid) {
    _initWatch(boardUuid);
  }

  StreamSubscription? _subscription;

  void _initWatch(String boardUuid) async {
    await GetIt.I<AppDatabase>().boardDAO.watchLinks(boardUuid).then((resp) {
      if (resp.links != null) {
        _subscription ?? resp.links?.listen(_setNotes);
      }
    });
  }

  List<BoardLink> _links = [];
  List<BoardLink> get links => _links;

  void _setNotes(List<BoardLink> data) {
    _links.clear();
    _links.addAll(data);
    notifyListeners();
  }

  bool _onliFavoriteds = false;
  bool get onliFavoriteds => _onliFavoriteds;
  void changeOnlyFavorited() {
    _onliFavoriteds = !_onliFavoriteds;
    notifyListeners();
  }

  void add(BoardLink? value) async {
    if (value == null) return;

    await GetIt.I<AppDatabase>().boardDAO.saveLink(value);
  }

  void deleteLink(BoardLink value) async =>
      await GetIt.I<AppDatabase>().boardDAO.deleteLink(value);

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    super.dispose();
  }
}
