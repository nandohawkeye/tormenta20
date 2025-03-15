import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/magic_selected/magic_selected_storage_service.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character_adapters.dart';

class MagicSelectedStore extends ChangeNotifier {
  MagicSelectedStore(this._magic) {
    _storageService.getAllGrimoires().then((resp) {
      _changeGrimories(resp.grimoires);
    });
    _setSub();
  }

  StreamSubscription? _sub;
  late final Magic _magic;
  final _storageService = MagicSelectedStorageService();

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

  void onTapGrimoire(Grimoire grimoire) async {
    if (grimoire.magicsCharacters.any((m) => m.id == _magic.id)) {
      final magicToDelete =
          grimoire.magicsCharacters.firstWhere(((m) => m.id == _magic.id));
      await _storageService.deleteMagic(magicToDelete);
    } else {
      final magicCharacter =
          MagicCharacterAdapters.createFromMagic(_magic, grimoire.uuid);
      await _storageService.insertMagic(magicCharacter);
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    _sub = null;
    super.dispose();
  }
}
