import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_type.dart';
import 'package:tormenta20/src/shared/utils/equipment_weapon_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditEquipmentWeaponTypeField extends StatefulWidget {
  const AddEditEquipmentWeaponTypeField({super.key});

  // final AddEditMenaceController controller;

  @override
  State<AddEditEquipmentWeaponTypeField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditEquipmentWeaponTypeField> {
  late final ValueNotifier<WeaponType?> _selected;
  void _setSelected(WeaponType? value) {
    _selected.value = value;

    // widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _selected = ValueNotifier<WeaponType?>(null);
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
        return SelectorOnlyField<WeaponType>(
          label: 'Tipos de arma',
          handleTitle: EquipmentWeaponTypeUtils.handleTitle,
          itens: WeaponType.values,
          onTap: _setSelected,
          selected: selected,
          isObrigatory: true,
        );
      },
    );
  }
}
