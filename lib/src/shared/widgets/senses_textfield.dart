import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class SensesTextfield extends StatelessWidget {
  const SensesTextfield({
    super.key,
    this.initialValue,
    required this.onchange,
  });

  final String? initialValue;
  final Function(String?) onchange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      initialValue: initialValue,
      style: const TextStyle(fontSize: 16),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Sentidos',
        fillColor: palette.backgroundLevelOne,
        helperText: 'Ex: Visão no escuro',
        helperStyle: TextStyle(color: palette.textDisable),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: T20UI.spaceSize,
        ),
      ),
    );
  }
}
