// ignore_for_file: prefer_final_fields

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/dices/atribute_roll_dice.dart';
import 'package:tormenta20/src/shared/entities/dices/atribute_roll_dice_ext.dart';
import 'package:uuid/uuid.dart';

class AddEditCharacterAtributeDicesStore extends ChangeNotifier {
  List<AtributeRollDice> _dices = [];
  List<AtributeRollDice> get dices => _dices;
  void createDicesAndRoll() {
    _dices.clear();
    for (int i = 0; i < 6; i++) {
      AtributeRollDice dice = AtributeRollDice(uuid: const Uuid().v4());
      dice.roll();
      _dices.add(dice);
    }

    notifyListeners();
  }

  AtributeRollDice? _selected;
  AtributeRollDice? get selected => _selected;
  void setSelected(AtributeRollDice value) {
    _selected = value;
    notifyListeners();
  }

  void setAtribute(Atribute value) {
    if (_selected == null) {
      return;
    }

    List<AtributeRollDice> oldDices = [];
    oldDices.addAll(_dices);
    if (_dices.any((d) => d.atribute == value)) {
      oldDices.firstWhereOrNull((d) => d.atribute == value)?.atribute = null;
    }

    oldDices.firstWhereOrNull((d) => d.uuid == _selected?.uuid)?.atribute =
        value;

    _dices.clear();
    _dices.addAll(oldDices);
    _selected = null;
    notifyListeners();
  }
}
