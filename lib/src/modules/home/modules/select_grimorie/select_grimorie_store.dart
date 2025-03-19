// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/select_grimorie/select_grimorie_storage_service.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';

class SelectGrimorieStore extends ChangeNotifier {
  SelectGrimorieStore(Grimoire? initial) {
    _selected = initial;
    _service.watchAllGrimoires().then((result) {
      if (result.grimoires != null) {
        _subscription ??= result.grimoires?.listen(_putGrmories);
      }
    });
  }

  StreamSubscription? _subscription;
  final SelectGrimorieStorageService _service = SelectGrimorieStorageService();

  List<Grimoire> _grimories = [];
  List<Grimoire> get grimories => _grimories;
  void _putGrmories(List<Grimoire> values) {
    _grimories.clear();
    _grimories.addAll(values);
    notifyListeners();
  }

  Grimoire? _selected;
  Grimoire? get selected => _selected;
  void setSelected(Grimoire value) {
    _selected = value;
    notifyListeners();
  }

  void insertGrimorie(Grimoire entity) async => await _service.insert(entity);

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    super.dispose();
  }
}
