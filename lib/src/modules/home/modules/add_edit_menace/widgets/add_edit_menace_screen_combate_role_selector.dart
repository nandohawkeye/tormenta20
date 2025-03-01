import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/utils/combat_role_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditMenaceScreenCombateRoleSelector extends StatefulWidget {
  const AddEditMenaceScreenCombateRoleSelector(
      {super.key, required this.controller});

  final AddEditMenaceController controller;

  @override
  State<AddEditMenaceScreenCombateRoleSelector> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditMenaceScreenCombateRoleSelector> {
  late final ValueNotifier<CombatRole?> _combatRole;
  void _setSelected(CombatRole value) {
    _combatRole.value = value;
    widget.controller.changeCombatRole(value);
  }

  @override
  void initState() {
    super.initState();
    _combatRole = ValueNotifier<CombatRole?>(widget.controller.combatRole);
  }

  @override
  void dispose() {
    _combatRole.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:
          Listenable.merge([widget.controller.errorCombatRole, _combatRole]),
      builder: (_, __) {
        final type = _combatRole.value;
        final hasError = widget.controller.errorCombatRole.value;
        return SelectorOnlyField<CombatRole>(
          label:
              'Papel de combate: ${type == null ? '' : CombatRoleUtils.handleTitle(type.name)}',
          handleTitle: CombatRoleUtils.handleTitle,
          itens: CombatRole.values,
          onTap: _setSelected,
          selected: type,
          isObrigatory: true,
          hasError: hasError,
        );
      },
    );
  }
}
