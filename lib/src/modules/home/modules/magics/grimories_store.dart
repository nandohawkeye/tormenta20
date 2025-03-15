import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/magics/grimories_storage_service.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';

class GrimoriesStore extends ChangeNotifier {
  StreamSubscription? _sub;
  final _storageService = GrimoriesStorageService();

  Future<GrimoriesStore> init() async {
    _storageService.getAllGrimoires().then((resp) {
      _changeGrimories(resp.grimoires);
    });
    _setSub();
    return this;
  }

  Future<Failure?> insertGrimoire(Grimoire entity) {
    return _storageService.insertGrimoire(entity);
  }

  void _setSub() async {
    await _storageService.watchAllGrimoires().then((resp) {
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
