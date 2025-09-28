import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class DisplacementsTextfield extends StatelessWidget {
  const DisplacementsTextfield({
    super.key,
    this.initialValue,
    this.onchange,
    this.onFieldSubmitted,
    this.onSaved,
  });

  final String? initialValue;
  final Function(String?)? onchange;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      initialValue: initialValue,
      style: const TextStyle(fontSize: 16),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Deslocamento',
        helperText: 'Ex: 5m, voo: 10m...',
        fillColor: palette.backgroundLevelOne,
      ),
    );
  }
}
