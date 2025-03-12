import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire_adapters.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character_adapters.dart';

class GrimorieStore extends ChangeNotifier {
  GrimorieStore(this._grimoire) {
    _setSub(_grimoire.uuid);
  }

  StreamSubscription? _sub;

  void _setSub(String grimoireUuid) async {
    await GetIt.I<AppDatabase>()
        .grimoireDAO
        .watchAllGrimoire(grimoireUuid)
        .then((resp) {
      if (resp.grimoires != null) {
        _sub ??= resp.grimoires!.listen((data) {
          if (data.isNotEmpty) {
            _grimoire = data.first;
            notifyListeners();
          }
        });
      }
    });
  }

  Grimoire _grimoire;
  Grimoire get grimoire => _grimoire;
  void updateGrimorie(Grimoire value) async {
    await GetIt.I<AppDatabase>().grimoireDAO.insertGrimoire(value);
  }

  void addMagics(List<Magic> values) async {
    try {
      final newMagics = values
          .map((m) => MagicCharacterAdapters.createFromMagic(m, _grimoire.uuid))
          .toList();
      final oldMagics = _grimoire.magicsCharacters;

      final upGriporio = GrimoireAdapters.copyWithNewMagics(
          _grimoire, [...oldMagics, ...newMagics]);

      await Future.forEach(
          newMagics,
          (magic) async => await GetIt.I<AppDatabase>()
              .magicCharacterDAO
              .insertMagic(magic));

      await GetIt.I<AppDatabase>().grimoireDAO.insertGrimoire(upGriporio);
    } catch (_) {}
  }

  void removeMagic(MagicCharacter magic) async {
    await GetIt.I<AppDatabase>()
        .magicCharacterDAO
        .deleteMagic(magic)
        .then((failure) async {
      if (failure != null) {
        List<MagicCharacter> allMagics = [];
        allMagics.addAll(_grimoire.magicsCharacters);
        allMagics.removeWhere((m) => m.uuid == magic.uuid);
        final upGriporio =
            GrimoireAdapters.copyWithNewMagics(_grimoire, allMagics);

        await GetIt.I<AppDatabase>().grimoireDAO.insertGrimoire(upGriporio);
      }
    });
  }

  void setupMagic(MagicCharacter magic) async {
    await GetIt.I<AppDatabase>().magicCharacterDAO.insertMagic(magic);
  }

  @override
  void dispose() {
    _sub?.cancel();
    _sub = null;
    super.dispose();
  }
}
