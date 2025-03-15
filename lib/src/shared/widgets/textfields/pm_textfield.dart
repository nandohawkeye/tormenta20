import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PmTextfield extends StatelessWidget {
  const PmTextfield({
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
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      decoration: const InputDecoration(
        labelText: 'PM',
      ),
    );
  }
}
