import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class StepsWeaponTextfield extends StatelessWidget {
  const StepsWeaponTextfield({
    super.key,
    this.initialValue,
    required this.onchange,
  });

  final int? initialValue;
  final Function(String?) onchange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      initialValue: initialValue?.toString(),
      style: const TextStyle(fontSize: 16),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
      ],
      decoration: InputDecoration(
        labelText: 'Passos',
        fillColor: palette.backgroundLevelOne,
      ),
    );
  }
}
