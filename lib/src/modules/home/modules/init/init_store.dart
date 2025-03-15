// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_storage_service.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';

class InitStore extends ChangeNotifier {
  StreamSubscription? _subBoards;
  StreamSubscription? _subMenaces;
  final _storageService = InitStorageService();

  Future<InitStore> init() async {
    _storageService.watchBoards().then((resp) {
      if (resp.boards != null) {
        _subBoards ??= resp.boards?.listen(_setBoards);
      }
    });

    _storageService.watchMenaces().then((resp) {
      if (resp.menaces != null) {
        _subMenaces ??= resp.menaces?.listen(_setMenaces);
      }
    });

    return this;
  }

  List<Board> _boards = [];
  List<Board> get boards => _boards;
  void _setBoards(List<Board> values) {
    _boards.clear();
    _boards.addAll(values);
    notifyListeners();
  }

  List<Menace> _menaces = [];
  List<Menace> get menaces => _menaces;
  void _setMenaces(List<Menace> values) {
    _menaces.clear();
    _menaces.addAll(values);
    notifyListeners();
  }

  @override
  void dispose() {
    _subBoards?.cancel();
    _subBoards = null;
    _subMenaces?.cancel();
    _subMenaces = null;
    super.dispose();
  }
}
