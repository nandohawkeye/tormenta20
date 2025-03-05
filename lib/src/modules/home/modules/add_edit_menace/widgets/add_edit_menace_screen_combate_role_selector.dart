import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/utils/combat_role_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditMenaceScreenCombateRoleSelector extends StatelessWidget {
  const AddEditMenaceScreenCombateRoleSelector(this.store, {super.key});

  final SelectorOnlyStore<CombatRole> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<CombatRole>(
      label: 'Papel de combate',
      handleTitle: CombatRoleUtils.handleTitle,
      itens: CombatRole.values,
      store: store,
      isObrigatory: true,
    );
  }
}
