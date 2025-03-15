import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class CasterInfosTextfield extends StatelessWidget {
  const CasterInfosTextfield({
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
        labelText: 'Infos de conjurador',
        helperText:
            'Ex: conjurador arcano de 20° nível (CD 55, limite de PM 32)',
        fillColor: palette.backgroundLevelOne,
      ),
    );
  }
}
