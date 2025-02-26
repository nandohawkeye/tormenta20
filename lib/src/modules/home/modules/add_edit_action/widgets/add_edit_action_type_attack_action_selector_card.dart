import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddEditActionTypeAttackActionSelectorCard extends StatelessWidget {
  const AddEditActionTypeAttackActionSelectorCard({
    super.key,
    required this.value,
    this.valueSelected,
    required this.onTap,
    required this.label,
  });

  final Type value;
  final Type? valueSelected;
  final Function(Type) onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == valueSelected;
    return Card(
      color: isSelected ? palette.selected : palette.backgroundLevelTwo,
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(value),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
