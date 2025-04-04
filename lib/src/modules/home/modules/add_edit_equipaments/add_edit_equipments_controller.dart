import 'package:flutter/cupertino.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_armor_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_general_item_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_improvement_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_proficiency_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_shield_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_special_material_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_weapon_purpose_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_weapon_range_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_weapon_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_equipment_wieldable_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/stores/add_edit_weapon_skill_type_store.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventurere_backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/entities/dices/dice.dart';
import 'package:uuid/uuid.dart';

class AddEditEquipmentsController {
  AddEditEquipmentsController(Equipment? initial, this._parentUuid) {
    if (initial == null) {
      _uuid = const Uuid().v4();
      improvementTypeStore = AddEditEquipmentImprovementTypeStore([]);
      materialTypeStore = AddEditEquipmentSpecialMaterialTypeStore(null);
      typeStore = AddEditEquipmentTypeStore(Weapon);
      proficiencyTypeStore = AddEditEquipmentProficiencyTypeStore(null);
      purposeTypeStore = AddEditEquipmentWeaponPurposeTypeStore(null);
      rangeTypeStore = AddEditEquipmentWeaponRangeTypeStore(null);
      weaponTypeStore = AddEditEquipmentWeaponTypeStore(null);
      wieldableTypeStore = AddEditEquipmentWieldableTypeStore(null);
      skillTypeStore = AddEditWeaponSkillTypeStore([]);
      armorTypeStore = AddEditEquipmentArmorTypeStore(null);
      shieldTypeStore = AddEditEquipmentShieldTypeStore(null);
      generalItemTypeStore = AddEditEquipmentGeneralItemTypeStore(null);
      errorDices = ValueNotifier<bool>(false);
      errorCritical = ValueNotifier<bool>(false);
    } else {
      _isEdit = true;
      _uuid = initial.uuid;
      _name = initial.name;
      _storedIn = initial.storedIn;

      improvementTypeStore =
          AddEditEquipmentImprovementTypeStore(initial.improvements);
      materialTypeStore =
          AddEditEquipmentSpecialMaterialTypeStore(initial.specialMaterial);

      if (initial is Weapon) {
        _dices = initial.dices;
        _critical = initial.critical;
        _price = initial.price;
        _desc = initial.desc;
        _criticalMultiplier = initial.criticalMultiplier;
        _isUnarmed = initial.isUnarmed;
        _isNaturalWeapon = initial.isNatural;
        _steps = initial.steps;
        typeStore = AddEditEquipmentTypeStore(Weapon);
        proficiencyTypeStore =
            AddEditEquipmentProficiencyTypeStore(initial.proficiency);
        purposeTypeStore =
            AddEditEquipmentWeaponPurposeTypeStore(initial.purpose);
        rangeTypeStore = AddEditEquipmentWeaponRangeTypeStore(initial.range);
        weaponTypeStore = AddEditEquipmentWeaponTypeStore(initial.type);
        wieldableTypeStore =
            AddEditEquipmentWieldableTypeStore(initial.wieldableType);
        skillTypeStore = AddEditWeaponSkillTypeStore(initial.skills);
        errorDices = ValueNotifier<bool>(false);
        errorCritical = ValueNotifier<bool>(false);
      }

      if (initial is Ammunition) {
        _price = initial.price;
        _desc = initial.desc;
        _quantity = initial.quantity;
        typeStore = AddEditEquipmentTypeStore(Ammunition);
      }

      if (initial is Armor) {
        _price = initial.price;
        _desc = initial.desc;
        _defenseBonus = initial.defenseBonus;
        _penalty = initial.penalty;
        typeStore = AddEditEquipmentTypeStore(Armor);
        armorTypeStore = AddEditEquipmentArmorTypeStore(initial.type);
      }

      if (initial is Shield) {
        _price = initial.price;
        _desc = initial.desc;
        _defenseBonus = initial.defenseBonus;
        _penalty = initial.penalty;
        typeStore = AddEditEquipmentTypeStore(Shield);
        shieldTypeStore = AddEditEquipmentShieldTypeStore(initial.type);
      }

      if (initial is GeneralItem) {
        _price = initial.price;
        _desc = initial.desc;
        typeStore = AddEditEquipmentTypeStore(GeneralItem);
        generalItemTypeStore =
            AddEditEquipmentGeneralItemTypeStore(initial.type);
      }

      if (initial is Backpack) {
        _price = initial.price;
        typeStore = AddEditEquipmentTypeStore(Backpack);
      }

      if (initial is AdventureBackpack) {
        _price = initial.price;
        typeStore = AddEditEquipmentTypeStore(AdventureBackpack);
      }

      if (initial is Saddlebag) {
        _price = initial.price;
        typeStore = AddEditEquipmentTypeStore(Saddlebag);
      }
    }
  }

  bool _isEdit = false;
  Type? _oldType;
  late final String _uuid;
  late final String _parentUuid;
  late final AddEditEquipmentTypeStore typeStore;
  late final AddEditEquipmentImprovementTypeStore improvementTypeStore;
  late final AddEditEquipmentProficiencyTypeStore proficiencyTypeStore;
  late final AddEditEquipmentSpecialMaterialTypeStore materialTypeStore;
  late final AddEditEquipmentWeaponPurposeTypeStore purposeTypeStore;
  late final AddEditEquipmentWeaponRangeTypeStore rangeTypeStore;
  late final AddEditEquipmentWeaponTypeStore weaponTypeStore;
  late final AddEditEquipmentWieldableTypeStore wieldableTypeStore;
  late final AddEditWeaponSkillTypeStore skillTypeStore;
  late final AddEditEquipmentArmorTypeStore armorTypeStore;
  late final AddEditEquipmentShieldTypeStore shieldTypeStore;
  late final AddEditEquipmentGeneralItemTypeStore generalItemTypeStore;

  void onChangeType(Type? value) {
    if (value == null) return;

    typeStore.onChange(value);

    if (_oldType != typeStore.data) {
      _oldType = typeStore.data;
      _reset();
    }
  }

  void _reset() {
    materialTypeStore.reset();
    purposeTypeStore.reset();
    improvementTypeStore.reset();
    proficiencyTypeStore.reset();
    rangeTypeStore.reset();
    weaponTypeStore.reset();
    wieldableTypeStore.reset();
    skillTypeStore.reset();
    armorTypeStore.reset();
    shieldTypeStore.reset();
    generalItemTypeStore.reset();
    _resetErrorDices();
    _resetErrorCrital();

    _name = null;
    _dices = null;
    _critical = null;
    _criticalMultiplier = null;
    _isNaturalWeapon = false;
    _isUnarmed = false;
    _price = null;
    _steps = null;
    _desc = null;
    _quantity = null;
    _defenseBonus = null;
    _penalty = null;
  }

  String? _name;
  String? get name => _name;
  void changeName(String? value) => _name = value;

  late final ValueNotifier<bool> errorDices;
  bool _validDices() {
    if (_dices?.isEmpty ?? true) {
      errorDices.value = true;
      return false;
    } else {
      errorDices.value = false;
      return true;
    }
  }

  _resetErrorDices() => errorDices.value = false;

  String? _dices;
  String? get dices => _dices;
  void _setDiceMacro(String? value) => _dices = value;
  void onChangeDice(List<Dice> dices) {
    int index = 0;
    if (dices.isEmpty) {
      _setDiceMacro(null);
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

    _setDiceMacro(formatted);
    _resetErrorDices();
  }

  int? _defenseBonus;
  int? get defenseBonus => _defenseBonus;
  void changeBonusDef(String? value) {
    if (value?.isEmpty ?? true) {
      _defenseBonus = null;
    } else {
      _defenseBonus = int.parse(value!);
    }
  }

  int? _penalty;
  int? get penalty => _penalty;
  void changePenalty(String? value) {
    if (value == '-') return;

    if (value?.isEmpty ?? true) {
      _penalty = null;
    } else {
      _penalty = int.parse(value!);
    }
  }

  int? _quantity;
  int? get quantity => _quantity;
  void changeQuantity(String? value) {
    if (value?.isEmpty ?? true) {
      _quantity = null;
    } else {
      _quantity = int.parse(value!);
    }
  }

  late final ValueNotifier<bool> errorCritical;
  bool _validCritical() {
    if (_critical == null || _criticalMultiplier == null) {
      errorCritical.value = true;
      return false;
    } else {
      errorCritical.value = false;
      return true;
    }
  }

  _resetErrorCrital() => errorCritical.value = false;

  int? _critical;
  int? get critical => _critical;
  void changeCritical(String? value) {
    if (value?.isEmpty ?? true) {
      _critical = null;
    } else {
      _critical = int.parse(value!);
      if (_criticalMultiplier != null) {
        _resetErrorCrital();
      }
    }
  }

  int? _criticalMultiplier;
  int? get criticalMultiplier => _criticalMultiplier;
  void changeCriticalMultiplier(String? value) {
    if (value?.isEmpty ?? true) {
      _criticalMultiplier = null;
    } else {
      _criticalMultiplier = int.parse(value!);
      if (_critical != null) {
        _resetErrorCrital();
      }
    }
  }

  bool _isNaturalWeapon = false;
  bool get isNaturalWeapon => _isNaturalWeapon;
  void changeIsNatural(bool value) => _isNaturalWeapon = value;

  bool _isUnarmed = false;
  bool get isUnarmed => _isUnarmed;
  void changeIsUnarmed(bool value) => _isUnarmed = value;

  double? _price;
  double? get price => _price;
  void changePrice(String? value) {
    if (value?.isEmpty ?? true) {
      _price = null;
    } else {
      _price = double.parse(value!);
    }
  }

  int? _steps;
  int? get steps => _steps;
  void changeSteps(String? value) {
    if (value?.isEmpty ?? true) {
      _steps = null;
    } else {
      _steps = int.parse(value!);
    }
  }

  double? _ocupadeSpace;
  double? get ocupadeSpace => _ocupadeSpace;
  void changeOcupadeSpace(String? value) {
    if (value?.isEmpty ?? true) {
      _ocupadeSpace = null;
    } else {
      _ocupadeSpace = double.parse(value!);
    }
  }

  String? _desc;
  String? get desc => _desc;
  void changeDesc(String? value) => _desc = value;

  String? _storedIn;

  bool _validate() {
    if (typeStore.data == Weapon) {
      return weaponTypeStore.validate() &&
          purposeTypeStore.validate() &&
          wieldableTypeStore.validate() &&
          proficiencyTypeStore.validate() &&
          rangeTypeStore.validate() &&
          _validDices() &&
          _validCritical();
    }

    if (typeStore.data == Armor) {
      return armorTypeStore.validate();
    }

    if (typeStore.data == Shield) {
      return shieldTypeStore.validate();
    }

    if (typeStore.data == GeneralItem) {
      return generalItemTypeStore.validate();
    }

    return true;
  }

  Equipment? onSave() {
    final isValid = _validate();

    if (!isValid) {
      return null;
    }

    return _createEquipment();
  }

  Equipment _createEquipment() {
    if (typeStore.data == Weapon) {
      final weapon = Weapon(
        name: _name!,
        uuid: _uuid,
        parentUuid: _parentUuid,
        desc: _desc,
        storedIn: _storedIn,
        improvements: improvementTypeStore.data,
        specialMaterial: materialTypeStore.data,
        type: weaponTypeStore.data!,
        price: _price,
        purpose: purposeTypeStore.data!,
        wieldableType: wieldableTypeStore.data!,
        proficiency: proficiencyTypeStore.data!,
        skills: skillTypeStore.data,
        steps: _steps,
        critical: _critical!,
        criticalMultiplier: _criticalMultiplier!,
        range: rangeTypeStore.data!,
        dices: dices!,
        isNatural: _isNaturalWeapon,
        isUnarmed: _isUnarmed,
        spaceOcuped: _ocupadeSpace ?? 0,
      );

      return weapon;
    } else if (typeStore.data == Armor) {
      final armor = Armor(
        uuid: _uuid,
        parentUuid: _parentUuid,
        name: _name!,
        desc: _desc,
        storedIn: _storedIn,
        improvements: improvementTypeStore.data,
        specialMaterial: materialTypeStore.data,
        spaceOcuped: _ocupadeSpace ?? 0,
        type: armorTypeStore.data!,
        price: _price,
        defenseBonus: _defenseBonus!,
        penalty: _penalty!,
      );

      return armor;
    } else if (typeStore.data == Shield) {
      final shield = Shield(
        uuid: _uuid,
        parentUuid: _parentUuid,
        name: _name!,
        desc: _desc,
        storedIn: _storedIn,
        improvements: improvementTypeStore.data,
        specialMaterial: materialTypeStore.data,
        spaceOcuped: _ocupadeSpace ?? 0,
        type: shieldTypeStore.data!,
        price: _price,
        defenseBonus: _defenseBonus!,
        penalty: _penalty!,
      );

      return shield;
    } else if (typeStore.data == GeneralItem) {
      final general = GeneralItem(
        uuid: _uuid,
        parentUuid: _parentUuid,
        name: _name!,
        desc: _desc,
        storedIn: _storedIn,
        improvements: improvementTypeStore.data,
        specialMaterial: materialTypeStore.data,
        spaceOcuped: _ocupadeSpace ?? 0,
        type: generalItemTypeStore.data!,
        price: _price,
      );

      return general;
    } else if (typeStore.data == Ammunition) {
      final ammunition = Ammunition(
        uuid: _uuid,
        parentUuid: _parentUuid,
        name: _name!,
        desc: _desc,
        storedIn: _storedIn,
        improvements: improvementTypeStore.data,
        specialMaterial: materialTypeStore.data,
        quantity: _quantity!,
        price: _price,
      );

      return ammunition;
    } else if (typeStore.data == Backpack) {
      final backpack = Backpack(
        uuid: _uuid,
        parentUuid: _parentUuid,
        price: _price,
      );

      return backpack;
    } else if (typeStore.data == AdventureBackpack) {
      final adventureBackpack = AdventureBackpack(
        uuid: _uuid,
        parentUuid: _parentUuid,
        price: _price,
      );

      return adventureBackpack;
    } else if (typeStore.data == Saddlebag) {
      final saddlebag = Saddlebag(
        uuid: _uuid,
        parentUuid: _parentUuid,
        price: _price,
      );

      return saddlebag;
    } else {
      final equipment = Equipment(
        uuid: _uuid,
        parentUuid: _parentUuid,
        name: _name ?? 'Desconhecido',
        storedIn: _storedIn,
        improvements: improvementTypeStore.data,
        specialMaterial: materialTypeStore.data,
      );

      return equipment;
    }
  }

  void dispose() {
    if (_isEdit) {
      improvementTypeStore.dispose();
      materialTypeStore.dispose();

      if (typeStore.data == Weapon) {
        proficiencyTypeStore.dispose();
        purposeTypeStore.dispose();
        rangeTypeStore.dispose();
        weaponTypeStore.dispose();
        wieldableTypeStore.dispose();
        skillTypeStore.dispose();
        errorDices.dispose();
        errorCritical.dispose();
      }

      if (typeStore.data == Armor) {
        armorTypeStore.dispose();
      }

      if (typeStore.data == Shield) {
        shieldTypeStore.dispose();
      }

      if (typeStore.data == GeneralItem) {
        generalItemTypeStore.dispose();
      }

      typeStore.dispose();
    } else {
      improvementTypeStore.dispose();
      materialTypeStore.dispose();
      proficiencyTypeStore.dispose();
      purposeTypeStore.dispose();
      rangeTypeStore.dispose();
      weaponTypeStore.dispose();
      wieldableTypeStore.dispose();
      skillTypeStore.dispose();
      typeStore.dispose();
      armorTypeStore.dispose();
      shieldTypeStore.dispose();
      generalItemTypeStore.dispose();
      errorDices.dispose();
      errorCritical.dispose();
    }
  }
}
