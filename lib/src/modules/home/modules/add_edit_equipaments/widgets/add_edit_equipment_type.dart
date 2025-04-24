import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventurere_backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditEquipamentType extends StatelessWidget {
  const AddEditEquipamentType(
    this.store, {
    super.key,
    required this.onChange,
    required this.isEnableToChange,
  });

  final SelectorOnlyStore<Type> store;
  final Function(Type?) onChange;
  final bool isEnableToChange;

  static const List<Type> _types = [
    Weapon,
    Ammunition,
    Armor,
    Shield,
    GeneralItem,
    Backpack,
    AdventureBackpack,
    Saddlebag,
  ];

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<Type>(
      label: 'Tipos de equipamento',
      handleTitle: EquipmentTypeUtils.handleTitle,
      itens: _types,
      store: store,
      onChange: onChange,
      isObrigatory: true,
      isEnableChange: isEnableToChange,
    );
  }
}
