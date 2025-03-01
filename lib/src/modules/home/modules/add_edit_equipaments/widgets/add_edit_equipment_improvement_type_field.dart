import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/improvement_types.dart';
import 'package:tormenta20/src/shared/utils/equipment_improvement_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_field.dart';

class AddEditEquipmentImprovementTypeField extends StatefulWidget {
  const AddEditEquipmentImprovementTypeField({super.key});

  // final AddEditMenaceController controller;

  @override
  State<AddEditEquipmentImprovementTypeField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditEquipmentImprovementTypeField> {
  late final ValueNotifier<List<ImprovementTypes>> _selecteds;
  void _setSelected(ImprovementTypes value) {
    List<ImprovementTypes> olds = _selecteds.value;
    if (olds.contains(value)) {
      olds.remove(value);
      _selecteds.value = [...olds];
    } else {
      _selecteds.value = [value, ...olds];
    }

    // widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _selecteds = ValueNotifier<List<ImprovementTypes>>([]);
  }

  @override
  void dispose() {
    _selecteds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selecteds,
      builder: (_, selecteds, __) {
        return SelectorMultiField<ImprovementTypes>(
          label: 'Melhorias',
          handleTitle: EquipmentImprovementTypeUtils.handleTitle,
          itens: ImprovementTypes.values,
          onTap: _setSelected,
          selecteds: selecteds,
        );
      },
    );
  }
}
