import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class DisplacementsTextfield extends StatelessWidget {
  const DisplacementsTextfield({
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
        labelText: 'Deslocamento',
        helperText: 'Ex: 5m, voo: 10m...',
        fillColor: palette.backgroundLevelOne,
        helperStyle: TextStyle(color: palette.textDisable),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: T20UI.spaceSize,
        ),
      ),
    );
  }
}
