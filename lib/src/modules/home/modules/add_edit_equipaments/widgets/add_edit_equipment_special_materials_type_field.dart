import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/special_material_types.dart';
import 'package:tormenta20/src/shared/utils/equipment_special_materials_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditEquipmentSpecialMaterialsTypeField extends StatefulWidget {
  const AddEditEquipmentSpecialMaterialsTypeField({super.key});

  // final AddEditMenaceController controller;

  @override
  State<AddEditEquipmentSpecialMaterialsTypeField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditEquipmentSpecialMaterialsTypeField> {
  late final ValueNotifier<SpecialMaterialTypes?> _selected;
  void _setSelected(SpecialMaterialTypes? value) {
    _selected.value = value;

    // widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _selected = ValueNotifier<SpecialMaterialTypes?>(null);
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
        return SelectorOnlyField<SpecialMaterialTypes>(
          label: 'Materiais especiais',
          handleTitle: EquipmentSpecialMaterialsUtils.handleTitle,
          itens: SpecialMaterialTypes.values,
          onTap: _setSelected,
          selected: selected,
          removeAll: () => _setSelected(null),
        );
      },
    );
  }
}
