import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';
import 'package:tormenta20/src/shared/entities/dices/dice.dart';
import 'package:uuid/uuid.dart';

class AddEditMagicMenaceStore {
  AddEditMagicMenaceStore(MagicMenace? magic, this._menaceUuid) {
    magicHasError = ValueNotifier<bool>(false);
    if (magic != null) {
      _uuid = magic.uuid;
      setDesc(magic.resumedDesc);
      setPm(magic.pm?.toString());
      setCd(magic.cd?.toString());
      setMagicBaseId(magic.magicBaseId);
      _setDice(magic.damageDices);
      _setExtraDice(magic.extraDamageDices);
      setMediumDamage(magic.mediumDamageValue?.toString());
    } else {
      _uuid = const Uuid().v4();
    }
  }

  late final ValueNotifier<bool> magicHasError;

  late String _uuid;
  late final String _menaceUuid;

  String? _dices;
  void _setDice(String? value) => _dices = value;
  void onChangeDice(List<Dice> dices) {
    int index = 0;
    if (dices.isEmpty) {
      _setDice(null);
      return;
    }

    String formatted = '';

    for (Dice dice in dices) {
      if (index > 0) {
        formatted += ',${dice.toString()}';
      } else {
        formatted += dice.toString();
      }

      index++;
    }

    _setDice(formatted);
  }

  String? _extraDices;
  void _setExtraDice(String? value) => _extraDices = value;
  void onChangeExtraDice(List<Dice> dices) {
    int index = 0;

    if (dices.isEmpty) {
      _setExtraDice(null);
      return;
    }

    String formatted = '';

    for (Dice dice in dices) {
      if (index > 0) {
        formatted += ',${dice.toString()}';
      } else {
        formatted += dice.toString();
      }

      index++;
    }

    _setExtraDice(formatted);
  }

  int? _magicBaseId;
  void setMagicBaseId(int? value) {
    _magicBaseId = value;
    magicHasError.value = false;
  }

  String? _name;
  void setMagicName(String? value) => _name = value;

  String? _desc;
  void setDesc(String? value) => _desc = value;

  int? _pm;
  void setPm(String? value) {
    if (value?.isEmpty ?? true) {
      _pm = null;
    } else {
      _pm = int.parse(value!);
    }
  }

  int? _cd;
  void setCd(String? value) {
    if (value?.isEmpty ?? true) {
      _cd = null;
    } else {
      _cd = int.parse(value!);
    }
  }

  int? _mediumDamage;
  void setMediumDamage(String? value) {
    if (value?.isEmpty ?? true) {
      _mediumDamage = null;
    } else {
      _mediumDamage = int.parse(value!);
    }
  }

  bool isMagicValid() {
    magicHasError.value = false;
    if (_magicBaseId == null) {
      magicHasError.value = true;
      return false;
    }

    return true;
  }

  MagicMenace onSave() {
    return MagicMenace(
      uuid: _uuid,
      name: _name!,
      menaceUuid: _menaceUuid,
      resumedDesc: _desc!,
      magicBaseId: _magicBaseId!,
      cd: _cd,
      pm: _pm,
      damageDices: _dices,
      extraDamageDices: _extraDices,
      mediumDamageValue: _mediumDamage,
    );
  }

  dispose() => magicHasError.dispose();
}
