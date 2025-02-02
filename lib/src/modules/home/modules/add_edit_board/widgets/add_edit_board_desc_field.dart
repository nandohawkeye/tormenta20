import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddEditBoardDescField extends StatelessWidget {
  const AddEditBoardDescField(this.onChanged, {super.key, this.initialValue});

  final Function(String) onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.newline,
      minLines: 1,
      maxLines: 10,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: 'Descrição',
        fillColor: palette.cardBackground,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 9,
          horizontal: T20UI.spaceSize,
        ),
      ),
    );
  }
}
