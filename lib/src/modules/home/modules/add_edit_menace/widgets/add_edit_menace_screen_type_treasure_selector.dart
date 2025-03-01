import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/shared/entities/treasure_type.dart';
import 'package:tormenta20/src/shared/utils/treasure_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditMenaceScreenTypeTreasureSelector extends StatefulWidget {
  const AddEditMenaceScreenTypeTreasureSelector(
      {super.key, required this.controller});

  final AddEditMenaceController controller;

  @override
  State<AddEditMenaceScreenTypeTreasureSelector> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditMenaceScreenTypeTreasureSelector> {
  late final ValueNotifier<TreasureType?> _treasures;
  void _setSelected(TreasureType value) {
    _treasures.value = value;
    widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _treasures = ValueNotifier<TreasureType?>(widget.controller.treasureType);
  }

  @override
  void dispose() {
    _treasures.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _treasures,
      builder: (_, selected, __) {
        return SelectorOnlyField<TreasureType>(
          label: 'Tesouros',
          handleTitle: TreasureTypeUtils.handleMenaceTitle,
          itens: TreasureType.values,
          onTap: _setSelected,
          selected: selected,
        );
      },
    );
  }
}
