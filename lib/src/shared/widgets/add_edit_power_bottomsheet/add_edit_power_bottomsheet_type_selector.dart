import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/power_type.dart';
import 'package:tormenta20/src/shared/utils/power_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_power_bottomsheet/add_edit_power_bottomsheet_type_store.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditPowerBottomsheetTypeSelector extends StatelessWidget {
  const AddEditPowerBottomsheetTypeSelector(this.store, {super.key});

  final AddEditPowerBottomsheetTypeStore store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<PowerType>(
      label: 'Tipo',
      handleTitle: PowerTypeUtils.handleTitle,
      itens: PowerType.values,
      store: store,
      isObrigatory: true,
      bodyColor: palette.backgroundLevelTwo,
      cardColor: palette.backgroundLevelThree,
    );
  }
}
