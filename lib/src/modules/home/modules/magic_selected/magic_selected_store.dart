import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character_adapters.dart';

class MagicSelectedStore extends ChangeNotifier {
  MagicSelectedStore(this._magic) {
    GetIt.I<AppDatabase>().grimoireDAO.getAllGrimoires().then((resp) {
      _changeGrimories(resp.grimoires);
    });
    _setSub();
  }

  StreamSubscription? _sub;
  late final Magic _magic;

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

  void onTapGrimoire(Grimoire grimoire) async {
    if (grimoire.magicsCharacters.any((m) => m.id == _magic.id)) {
      final magicToDelete =
          grimoire.magicsCharacters.firstWhere(((m) => m.id == _magic.id));
      await GetIt.I<AppDatabase>().magicCharacterDAO.deleteMagic(magicToDelete);
    } else {
      final magicCharacter =
          MagicCharacterAdapters.createFromMagic(_magic, grimoire.uuid);
      await GetIt.I<AppDatabase>()
          .magicCharacterDAO
          .insertMagic(magicCharacter);
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    _sub = null;
    super.dispose();
  }
}
