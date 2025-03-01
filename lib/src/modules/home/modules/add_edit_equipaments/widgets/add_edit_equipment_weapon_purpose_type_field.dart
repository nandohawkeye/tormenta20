import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_purpose.dart';
import 'package:tormenta20/src/shared/utils/equipament_weapon_purpose_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditEquipmentWeaponPurposeTypeField extends StatefulWidget {
  const AddEditEquipmentWeaponPurposeTypeField({super.key});

  // final AddEditMenaceController controller;

  @override
  State<AddEditEquipmentWeaponPurposeTypeField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditEquipmentWeaponPurposeTypeField> {
  late final ValueNotifier<WeaponPurpose?> _selected;
  void _setSelected(WeaponPurpose? value) {
    _selected.value = value;

    // widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _selected = ValueNotifier<WeaponPurpose?>(null);
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
        return SelectorOnlyField<WeaponPurpose>(
          label: 'Propósito',
          handleTitle: EquipamentWeaponPurposeUtils.handleTitle,
          itens: WeaponPurpose.values,
          onTap: _setSelected,
          selected: selected,
          isObrigatory: true,
        );
      },
    );
  }
}
