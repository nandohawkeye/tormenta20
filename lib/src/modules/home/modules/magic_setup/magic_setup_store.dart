import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/entities/rool_dice.dart';

class MagicSetupStore {
  MagicSetupStore(this._magic) {
    _dices = _magic.damageDices;
    _extraDices = _magic.extraDamageDices;
    _pm = _magic.pm ?? 1;
    _cd = _magic.cd ?? 0;
    _mediumDamage = _magic.mediumDamageValue;
  }

  final MagicCharacter _magic;
  String? _dices;
  void _setDice(String? value) => _dices = value;
  void onChangeDice(List<RoolDice> dices) {
    int index = 0;
    if (dices.isEmpty) {
      _setDice(null);
      return;
    }

    String formatted = '';

    for (RoolDice dice in dices) {
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
  void onChangeExtraDice(List<RoolDice> dices) {
    int index = 0;

    if (dices.isEmpty) {
      _setExtraDice(null);
      return;
    }

    String formatted = '';

    for (RoolDice dice in dices) {
      if (index > 0) {
        formatted += ',${dice.toString()}';
      } else {
        formatted += dice.toString();
      }

      index++;
    }

    _setExtraDice(formatted);
  }

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

  MagicCharacter onSave() {
    return _magic.copyWith(
      pm: _pm,
      cd: _cd,
      damageDices: _dices,
      extraDamageDices: _extraDices,
      mediumDamageValue: _mediumDamage,
    );
  }
}
