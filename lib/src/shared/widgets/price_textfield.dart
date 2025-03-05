import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class PriceTextfield extends StatelessWidget {
  const PriceTextfield({super.key, this.initialValue, required this.onchange});

  final double? initialValue;
  final Function(String?) onchange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onchange(value.replaceAll(',', '.')),
      initialValue: initialValue?.toString().replaceAll('.', ','),
      style: const TextStyle(fontSize: 16),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
      ],
      decoration: InputDecoration(
        labelText: 'Preço',
        prefix: const Text('T\$ ', style: TextStyle(fontSize: 16)),
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
