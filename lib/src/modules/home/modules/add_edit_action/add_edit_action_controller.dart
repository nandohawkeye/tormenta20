import 'package:tormenta20/src/modules/home/modules/add_edit_action/stores/add_edit_action_class_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/stores/add_edit_action_type_store.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_type.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/rool_dice.dart';
import 'package:uuid/uuid.dart';

class AddEditActionController {
  AddEditActionController(ActionEnt? initialValue, this._parentUuid) {
    if (initialValue != null) {
      _name = initialValue.name;
      _desc = initialValue.desc;
      _uuid = initialValue.uuid;
      _critical = initialValue.critical;
      _criticalMultiplier = initialValue.criticalMultiplier;
      _mediumDamage = initialValue.mediumDamageValue;
      _equipment = initialValue.equipament;
      setPm(initialValue.pm?.toString());
      setCd(initialValue.cd?.toString());
      _setDice(initialValue.damageDices);
      _setExtraDice(initialValue.extraDamageDices);
      classTypeStore = AddEditActionClassTypeStore(initialValue.runtimeType);
      typeStore = AddEditActionTypeStore(initialValue.type);
    } else {
      _uuid = const Uuid().v4();
      classTypeStore = AddEditActionClassTypeStore(ActionEnt);
      typeStore = AddEditActionTypeStore(ActionType.passive);
    }
  }

  late final AddEditActionTypeStore typeStore;
  late final AddEditActionClassTypeStore classTypeStore;

  final String _parentUuid;
  late final String _uuid;

  int? _critical;
  int? get critical => _critical;
  void changeCritical(String? value) {
    if (value?.isEmpty ?? true) {
      _critical = null;
    } else {
      _critical = int.parse(value!);
    }
  }

  int? _criticalMultiplier;
  int? get criticalMultiplier => _criticalMultiplier;
  void changeCriticalMultiplier(String? value) {
    if (value?.isEmpty ?? true) {
      _criticalMultiplier = null;
    } else {
      _criticalMultiplier = int.parse(value!);
    }
  }

  String? _dices;
  String? get dices => _dices;
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
  String? get extraDices => _extraDices;
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
  int? get pm => _pm;
  void setPm(String? value) {
    if (value?.isEmpty ?? true) {
      _pm = null;
    } else {
      _pm = int.parse(value!);
    }
  }

  int? _cd;
  int? get cd => _cd;
  void setCd(String? value) {
    if (value?.isEmpty ?? true) {
      _cd = null;
    } else {
      _cd = int.parse(value!);
    }
  }

  int? _mediumDamage;
  int? get mediumDamage => _mediumDamage;
  void setMediumDamage(String? value) {
    if (value?.isEmpty ?? true) {
      _mediumDamage = null;
    } else {
      _mediumDamage = int.parse(value!);
    }
  }

  String? _name;
  String? get name => _name;
  void onChangeName(String? value) {
    if (value == null) return;

    _name = value;
  }

  String? _desc;
  String? get desc => _desc;
  void onChangeDesc(String? value) {
    if (value == null) return;

    _desc = value;
  }

  Equipment? _equipment;
  Equipment? get equipment => _equipment;
  void onChangeEquipemt(Equipment? value) => _equipment = value;

  void changeAttackActionType(Type value) {
    classTypeStore.onChange(value);
    typeStore.onChange(ActionType.standard);
  }

  void onChangeType(ActionType? value) {
    typeStore.onChange(value);
    classTypeStore.onChange(ActionEnt);
  }

  ActionEnt? onSave() {
    final type = classTypeStore.data;

    if (type == HandToHand) {
      return HandToHand(
        uuid: _uuid,
        parentUuid: _parentUuid,
        name: name!,
        desc: desc!,
        pm: _pm,
        cd: _cd,
        damageDices: _dices,
        extraDamageDices: _extraDices,
        mediumDamageValue: _mediumDamage,
        critical: _critical,
        criticalMultiplier: _criticalMultiplier,
        equipament: _equipment,
      );
    }

    if (type == DistanceAttack) {
      return DistanceAttack(
        uuid: _uuid,
        parentUuid: _parentUuid,
        name: name!,
        desc: desc!,
        pm: _pm,
        cd: _cd,
        damageDices: _dices,
        extraDamageDices: _extraDices,
        mediumDamageValue: _mediumDamage,
        critical: _critical,
        criticalMultiplier: _criticalMultiplier,
        equipament: _equipment,
      );
    }

    return ActionEnt(
      uuid: _uuid,
      parentUuid: _parentUuid,
      name: name!,
      desc: desc!,
      type: typeStore.data!,
      pm: _pm,
      cd: _cd,
      damageDices: _dices,
      extraDamageDices: _extraDices,
      mediumDamageValue: _mediumDamage,
      critical: _critical,
      criticalMultiplier: _criticalMultiplier,
      equipament: _equipment,
    );
  }

  dispose() {
    classTypeStore.dispose();
    typeStore.dispose();
  }
}
