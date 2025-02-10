import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddGrimorieBottomsheetDescField extends StatelessWidget {
  const AddGrimorieBottomsheetDescField({super.key, required this.desc});

  final ValueNotifier<String?> desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontalPadding,
      child: TextFormField(
        onChanged: (value) => desc.value = value,
        minLines: 1,
        maxLines: 4,
        initialValue: desc.value,
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.newline,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          labelText: 'Descrição',
          fillColor: palette.backgroundLevelOne,
          hintStyle: TextStyle(fontSize: 16, color: palette.textPrimary),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: T20UI.spaceSize,
          ),
        ),
      ),
    );
  }
}
