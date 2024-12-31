import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';

class GrimoriesStore extends ChangeNotifier {
  GrimoriesStore() {
    GetIt.I<AppDatabase>().grimoireDAO.getAllGrimoires().then((resp) {
      _changeGrimories(resp.grimoires);
    });
  }
  List<Grimoire> _grimories = [];
  List<Grimoire> get grimories => _grimories;
  void _changeGrimories(List<Grimoire> values) {
    _grimories.clear();
    _grimories = values;
    notifyListeners();
  }
}
