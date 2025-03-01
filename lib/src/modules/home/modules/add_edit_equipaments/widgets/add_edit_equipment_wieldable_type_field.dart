import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/Wieldable_type.dart';
import 'package:tormenta20/src/shared/utils/equipment_wieldable_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditEquipmentWieldableTypeField extends StatefulWidget {
  const AddEditEquipmentWieldableTypeField({super.key});

  // final AddEditMenaceController controller;

  @override
  State<AddEditEquipmentWieldableTypeField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditEquipmentWieldableTypeField> {
  late final ValueNotifier<WieldableType?> _selected;
  void _setSelected(WieldableType? value) {
    _selected.value = value;

    // widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _selected = ValueNotifier<WieldableType?>(null);
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
        return SelectorOnlyField<WieldableType>(
          label: 'Empunhadura',
          handleTitle: EquipmentWieldableTypeUtils.handleTitle,
          itens: WieldableType.values,
          onTap: _setSelected,
          selected: selected,
          isObrigatory: true,
        );
      },
    );
  }
}
