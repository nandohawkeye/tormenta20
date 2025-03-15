import 'package:flutter/material.dart';
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
      ),
    );
  }
}
