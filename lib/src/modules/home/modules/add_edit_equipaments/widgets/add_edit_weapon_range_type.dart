import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment_weapon_range_type.dart';
import 'package:tormenta20/src/shared/utils/equipment_weapon_range_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditWeaponRangeType extends StatefulWidget {
  const AddEditWeaponRangeType({super.key});

  // final AddEditMenaceController controller;

  @override
  State<AddEditWeaponRangeType> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditWeaponRangeType> {
  late final ValueNotifier<EquipmentWeaponRangeType?> _selected;
  void _setSelected(EquipmentWeaponRangeType? value) {
    _selected.value = value;

    // widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _selected = ValueNotifier<EquipmentWeaponRangeType?>(null);
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
        return SelectorOnlyField<EquipmentWeaponRangeType>(
          label: 'Alcance',
          handleTitle: EquipmentWeaponRangeTypeUtils.handleTitle,
          itens: EquipmentWeaponRangeType.values,
          onTap: _setSelected,
          selected: selected,
          isObrigatory: true,
        );
      },
    );
  }
}
