import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_storage_service.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/entities/power.dart';

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

  Future<void> changeAtributeHandToHand(Atribute atribute) async {
    await _storageService.changeAtributeHandToHand(
      _characterBoard.value.uuid,
      atribute,
    );
  }

  Future<void> changeCreatureSize(CreatureSizeCategory creatureSize) async {
    await _storageService.changeCreatureSize(
      _characterBoard.value.uuid,
      creatureSize,
    );
  }

  Future<void> changeDisplacement(String? displacement) async {
    await _storageService.changeDisplacement(
      _characterBoard.value.uuid,
      displacement,
    );
  }

  Future<void> changeSenses(String? senses) async {
    await _storageService.changeSenses(_characterBoard.value.uuid, senses);
  }

  Future<void> saveAction(ActionEnt entity) async => _storageService
      .saveActionAndUpdateCharacterRecord(entity, _characterBoard.value.uuid);

  Future<void> savePower(Power entity) async => _storageService
      .savePowerAndUpdateCharacterRecord(entity, _characterBoard.value.uuid);

  Future<void> saveOrigin(Origin entity) async => _storageService
      .saveOriginAndUpdateCharacterRecord(entity, _characterBoard.value.uuid);

  Future<void> saveExpertise(Expertise entity) async =>
      _storageService.saveExpertiseAndUpdateCharacterRecord(
        entity,
        _characterBoard.value.uuid,
      );

  Future<void> deleteOrigin(Origin entity) async => _storageService
      .deleteOriginAndUpdateCharacterRecord(entity, _characterBoard.value.uuid);

  Future<void> saveEquipment(Equipment entity) async =>
      _storageService.saveEquipmentAndUpdateCharacterRecord(
        entity,
        _characterBoard.value.uuid,
      );

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
