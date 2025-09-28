import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class SensesTextfield extends StatelessWidget {
  const SensesTextfield({
    super.key,
    this.initialValue,
    this.onchange,
    this.onSaved,
    this.onFieldSubmitted,
  });

  final String? initialValue;
  final Function(String?)? onchange;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
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
