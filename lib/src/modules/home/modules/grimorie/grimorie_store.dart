import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_storage_service.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire_adapters.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character_adapters.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';

class GrimorieStore extends ChangeNotifier {
  GrimorieStore(this._grimoire) {
    _setSub(_grimoire.uuid);
  }

  StreamSubscription? _sub;

  void _setSub(String grimoireUuid) async {
    await _storageService.watchAllGrimoire(grimoireUuid).then((resp) {
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

  final _storageService = GrimorieStorageService();

  Future<Failure?> deleteGrimoire() {
    return _storageService.deleteGrimoire(_grimoire);
  }

  Grimoire _grimoire;
  Grimoire get grimoire => _grimoire;
  void updateGrimorie(Grimoire value) async {
    await _storageService.insertGrimoire(value);
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
          newMagics, (magic) async => await _storageService.insertMagic(magic));

      await _storageService.insertGrimoire(upGriporio);
    } catch (_) {}
  }

  void removeMagic(MagicCharacter magic) async {
    await _storageService.deleteMagic(magic).then((failure) async {
      if (failure != null) {
        List<MagicCharacter> allMagics = [];
        allMagics.addAll(_grimoire.magicsCharacters);
        allMagics.removeWhere((m) => m.uuid == magic.uuid);
        final upGriporio =
            GrimoireAdapters.copyWithNewMagics(_grimoire, allMagics);

        await _storageService.insertGrimoire(upGriporio);
      }
    });
  }

  void setupMagic(MagicCharacter magic) async {
    await _storageService.insertMagic(magic);
  }

  @override
  void dispose() {
    _sub?.cancel();
    _sub = null;
    super.dispose();
  }
}
