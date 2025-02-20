import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/utils/combat_role_utils.dart';

class AddEditMenaceScreenCombateRoleSelectorCard extends StatelessWidget {
  const AddEditMenaceScreenCombateRoleSelectorCard({
    super.key,
    required this.combatRole,
    this.selected,
    required this.onTap,
  });

  final CombatRole combatRole;
  final CombatRole? selected;
  final Function(CombatRole) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = combatRole == selected;

    return AnimatedContainer(
      height: T20UI.inputHeight * MediaQuery.of(context).textScaler.scale(1),
      duration: T20UI.defaultDurationAnimation,
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: isSelected ? palette.selected : palette.backgroundLevelTwo,
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(combatRole),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CombatRoleUtils.handleTitle(combatRole.name),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
