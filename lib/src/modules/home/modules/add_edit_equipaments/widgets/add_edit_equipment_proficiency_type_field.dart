import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_proficiency.dart';
import 'package:tormenta20/src/shared/utils/equipment_proficiency_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditEquipmentProficiencyTypeField extends StatefulWidget {
  const AddEditEquipmentProficiencyTypeField({super.key});

  // final AddEditMenaceController controller;

  @override
  State<AddEditEquipmentProficiencyTypeField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditEquipmentProficiencyTypeField> {
  late final ValueNotifier<WeaponProficiency?> _selected;
  void _setSelected(WeaponProficiency? value) {
    _selected.value = value;

    // widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _selected = ValueNotifier<WeaponProficiency?>(null);
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
        return SelectorOnlyField<WeaponProficiency>(
          label: 'Proficiência',
          handleTitle: EquipmentProficiencyTypeUtils.handleTitle,
          itens: WeaponProficiency.values,
          onTap: _setSelected,
          selected: selected,
          isObrigatory: true,
        );
      },
    );
  }
}
