import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/add_edit_action_store.dart';
import 'package:tormenta20/src/shared/entities/action/action_type.dart';
import 'package:tormenta20/src/shared/utils/action_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditTypeActionField extends StatelessWidget {
  const AddEditTypeActionField({super.key, required this.store});

  final AddEditActionStore store;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store.type,
      builder: (_, selected, __) {
        return SelectorOnlyField<ActionType>(
          label: 'Tipo',
          handleTitle: ActionTypeUtils.handleTitle,
          itens: ActionType.values,
          onTap: store.onChangeType,
          selected: selected,
        );
      },
    );
  }
}
