import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_storage_service.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';

class CharacterRecordStore {
  CharacterRecordStore(CharacterBoard characterBoard)
    : _characterBoard = ValueNotifier(characterBoard) {
    _setInitialLifeandMana();
  }

  final _storageService = CharacterRecordStorageService();

  late final StreamSubscription _sub;

  final ValueNotifier<CharacterBoard> _characterBoard;
  ValueListenable<CharacterBoard> get characterBoard => _characterBoard;

  final ValueNotifier<int> _tabIndex = ValueNotifier(0);
  ValueListenable<int> get tabIndex => _tabIndex;
  void changeTabIndex(int index) => _tabIndex.value = index;

  final ValueNotifier<int> _life = ValueNotifier(0);
  ValueListenable<int> get life => _life;

  final ValueNotifier<int> _mana = ValueNotifier(0);
  ValueListenable<int> get mana => _mana;

  void _setInitialLifeandMana() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _life.value = _characterBoard.value.life;
    _mana.value = _characterBoard.value.mana;
    await _storageService.watchCharacter(_characterBoard.value.uuid).then((
      response,
    ) {
      if (response.character != null) {
        _sub = response.character!.listen((result) {
          if (result != null) {
            _characterBoard.value = result;
          }
        });
      }
    });
  }

  dispose() {
    _characterBoard.dispose();
    _life.dispose();
    _mana.dispose();
    _tabIndex.dispose();
    _sub.cancel();
  }
}
