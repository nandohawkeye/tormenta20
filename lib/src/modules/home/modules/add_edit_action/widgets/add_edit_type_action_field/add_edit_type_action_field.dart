import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/stores/add_edit_action_type_store.dart';
import 'package:tormenta20/src/shared/entities/action/action_type.dart';
import 'package:tormenta20/src/shared/utils/action_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditTypeActionField extends StatelessWidget {
  const AddEditTypeActionField({
    super.key,
    required this.store,
    required this.onChange,
  });

  final AddEditActionTypeStore store;
  final Function(ActionType?) onChange;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<ActionType>(
      label: 'Tipo',
      handleTitle: ActionTypeUtils.handleTitle,
      itens: ActionType.values,
      store: store,
      onChange: onChange,
    );
  }
}
