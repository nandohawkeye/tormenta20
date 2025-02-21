import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';

class GrimoriesStore extends ChangeNotifier {
  StreamSubscription? _sub;

  Future<GrimoriesStore> init() async {
    GetIt.I<AppDatabase>().grimoireDAO.getAllGrimoires().then((resp) {
      _changeGrimories(resp.grimoires);
    });
    _setSub();
    return this;
  }

  void _setSub() async {
    await GetIt.I<AppDatabase>().grimoireDAO.watchAllGrimoires().then((resp) {
      if (resp.grimoires != null) {
        _sub ??= resp.grimoires!.listen((data) {
          _changeGrimories(data);
        });
      }
    });
  }

  List<Grimoire> _grimories = [];
  List<Grimoire> get grimories => _grimories;
  void _changeGrimories(List<Grimoire> values) {
    _grimories.clear();
    _grimories = values;
    notifyListeners();
  }

  @override
  void dispose() {
    _sub?.cancel();
    _sub = null;
    super.dispose();
  }
}
