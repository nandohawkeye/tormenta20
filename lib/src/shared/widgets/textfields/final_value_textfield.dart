import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class FinalValueTextfield extends StatelessWidget {
  const FinalValueTextfield({
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
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      decoration: InputDecoration(
        labelText: 'Valor',
        helperStyle: TextStyle(color: palette.textDisable),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: T20UI.spaceSize,
        ),
      ),
    );
  }
}
