import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventurer_backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/utils/equipment_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditEquipamentType extends StatefulWidget {
  const AddEditEquipamentType({super.key});

  // final AddEditMenaceController controller;

  @override
  State<AddEditEquipamentType> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditEquipamentType> {
  final List<Type> _types = [
    Weapon,
    Ammunition,
    Armor,
    Shield,
    GeneralItem,
    Saddlebag,
    AdventurerBackpack,
    Backpack
  ];

  late final ValueNotifier<Type> _selected;
  void _setSelected(Type value) {
    _selected.value = value;
    // widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _selected = ValueNotifier<Type>(Weapon);
  }

  @override
  void dispose() {
    _selected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selected,
      builder: (_, selected, __) {
        return SelectorOnlyField<Type>(
          label: 'Tipos de equipamento',
          handleTitle: EquipmentTypeUtils.handleTitle,
          itens: _types,
          onTap: _setSelected,
          selected: selected,
          isObrigatory: true,
        );
      },
    );
  }
}
