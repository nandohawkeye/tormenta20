import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/entities/creature_size.dart';
import 'package:tormenta20/src/shared/entities/creature_vision.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/entities/menace_type.dart';
import 'package:uuid/uuid.dart';

class AddEditMenaceController {
  AddEditMenaceController(Menace? menace) {
    stage = ValueNotifier<int>(1);
    percent = ValueNotifier<double>(0.0);
    if (menace != null) {
      _uuid = menace.uuid;
      _type = menace.type;
      _creatureVision = menace.vision;
      _imagePath = menace.imagePath;
      _imageAsset = menace.imageAsset;
      _name = menace.name;
      _nd = menace.nd;
      _life = menace.life;
      _mana = menace.mana;
      _initiative = menace.initiative;
      _defense = menace.defense;
      _perception = menace.perception;
      _resisFort = menace.fortResistence;
      _resisRef = menace.refResistence;
      _resisVon = menace.vonResistence;
      _strength = menace.strength;
      _constitution = menace.constitution;
      _dexterity = menace.dexterity;
      _intelligence = menace.intelligence;
      _wisdom = menace.wisdom;
      _charisma = menace.charisma;
      _creatureSize = menace.creatureSize;
      _combatRole = menace.combatRole;
      //TODO refactor displacements
      // _displacement = menace.displacements;
    } else {
      _uuid = const Uuid().v4();
    }
  }

  late final String _uuid;

  late final ValueNotifier<int> stage;
  void setStage(int value) => stage.value = value;

  late final ValueNotifier<double> percent;
  void setPercent(double value) => percent.value = value;

  final ValueNotifier<bool> errorValidadeType = ValueNotifier<bool>(false);
  void setErroValidadeType(bool value) => errorValidadeType.value = value;

  MenaceType? _type;
  MenaceType? get type => _type;
  void changeType(MenaceType value) {
    _type = value;
    errorValidadeType.value = false;
  }

  bool isValidType() {
    if (_type == null) {
      errorValidadeType.value = true;
      return false;
    } else {
      return true;
    }
  }

  final ValueNotifier<bool> errorCombatRole = ValueNotifier<bool>(false);
  void setErrorCombatRole(bool value) => errorCombatRole.value = value;

  CombatRole? _combatRole;
  CombatRole? get combatRole => _combatRole;
  void changeCombatRole(CombatRole value) {
    _combatRole = value;
    errorCombatRole.value = false;
  }

  bool isValidCombatRole() {
    if (_combatRole == null) {
      errorCombatRole.value = true;
      return false;
    } else {
      return true;
    }
  }

  final ValueNotifier<bool> errorCreatureSize = ValueNotifier<bool>(false);
  void setErrorCreatureSize(bool value) => errorCreatureSize.value = value;

  CreatureSize? _creatureSize;
  CreatureSize? get creatureSize => _creatureSize;
  void changeCreatureSize(CreatureSize value) {
    _creatureSize = value;
    errorCreatureSize.value = false;
  }

  bool isValidCreatureSize() {
    if (_creatureSize == null) {
      errorCreatureSize.value = true;
      return false;
    } else {
      return true;
    }
  }

  final ValueNotifier<bool> errorCreatureVision = ValueNotifier<bool>(false);
  void setErrorCreatureVision(bool value) => errorCreatureVision.value = value;

  CreatureVision? _creatureVision;
  CreatureVision? get creatureVision => _creatureVision;
  void changeCreatureVision(CreatureVision value) {
    _creatureVision = value;
    errorCreatureVision.value = false;
  }

  bool isValidCreatureVision() {
    if (_creatureVision == null) {
      errorCreatureVision.value = true;
      return false;
    } else {
      return true;
    }
  }

  String? _imagePath;
  String? get imagePath => _imagePath;
  void changePath(String? value) => _imagePath = value;

  String? _imageAsset;
  String? get imageAsset => _imageAsset;
  void changeAsset(String? value) => _imageAsset = value;

  String? _name;
  String? get name => _name;
  void changeName(String? value) => _name = value;

  String? _nd;
  String? get nd => _nd;
  void changeND(String? value) => _nd = value;

  int? _life;
  int? get life => _life;
  void changeLife(String? value) {
    if (value?.isEmpty ?? true) {
      _life = null;
      return;
    }

    _life = int.parse(value!);
  }

  int? _mana;
  int? get mana => _mana;
  void changeMana(String? value) {
    if (value?.isEmpty ?? true) {
      _mana = null;
      return;
    }

    _mana = int.parse(value!);
  }

  int? _initiative;
  int? get initiative => _initiative;
  void changeInitiative(String? value) {
    if (value?.isEmpty ?? true) {
      _initiative = null;
      return;
    }

    _initiative = int.parse(value!);
  }

  int? _defense;
  int? get defense => _defense;
  void changeDefense(String? value) {
    if (value?.isEmpty ?? true) {
      _defense = null;
      return;
    }

    _defense = int.parse(value!);
  }

  int? _perception;
  int? get perception => _perception;
  void changePerception(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _perception = null;
      return;
    }

    _perception = int.parse(value!);
  }

  int? _resisFort;
  int? get resisFort => _resisFort;
  void changeResisFort(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _resisFort = null;
      return;
    }

    _resisFort = int.parse(value!);
  }

  int? _resisRef;
  int? get resisRef => _resisRef;
  void changeResisRef(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _resisRef = null;
      return;
    }

    _resisRef = int.parse(value!);
  }

  int? _resisVon;
  int? get resisVon => _resisVon;
  void changeResisVon(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _resisVon = null;
      return;
    }

    _resisVon = int.parse(value!);
  }

  int? _strength;
  int? get strength => _strength;
  void changeStrength(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _strength = null;
      return;
    }

    _strength = int.parse(value!);
  }

  int? _dexterity;
  int? get dexterity => _dexterity;
  void changeDexterity(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _dexterity = null;
      return;
    }

    _dexterity = int.parse(value!);
  }

  int? _constitution;
  int? get constitution => _constitution;
  void changeConstitution(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _constitution = null;
      return;
    }

    _constitution = int.parse(value!);
  }

  int? _intelligence;
  int? get intelligence => _intelligence;
  void changeIntelligence(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _intelligence = null;
      return;
    }

    _intelligence = int.parse(value!);
  }

  int? _wisdom;
  int? get wisdom => _wisdom;
  void changeWisdom(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _wisdom = null;
      return;
    }

    _wisdom = int.parse(value!);
  }

  int? _charisma;
  int? get charisma => _charisma;
  void changeCharisma(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _charisma = null;
      return;
    }

    _charisma = int.parse(value!);
  }

  dispose() {
    stage.dispose();
    percent.dispose();
    errorValidadeType.dispose();
    errorCreatureSize.dispose();
    errorCreatureVision.dispose();
    errorCombatRole.dispose();
  }
}
