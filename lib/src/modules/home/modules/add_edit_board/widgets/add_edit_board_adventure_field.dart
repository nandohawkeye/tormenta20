import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddEditBoardAdventureField extends StatefulWidget {
  const AddEditBoardAdventureField(this.onChanged,
      {super.key, this.initialValue});

  final Function(String) onChanged;
  final String? initialValue;

  @override
  State<AddEditBoardAdventureField> createState() => _BoardNameFieldState();
}

class _BoardNameFieldState extends State<AddEditBoardAdventureField> {
  late final ValueNotifier<String?> _errorNotifier;

  @override
  void initState() {
    super.initState();
    _errorNotifier = ValueNotifier<String?>(null);
  }

  @override
  void dispose() {
    _errorNotifier.dispose();
    super.dispose();
  }

  String? _validate(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _errorNotifier,
      builder: (_, error, __) {
        return TextFormField(
          initialValue: widget.initialValue,
          onChanged: (value) {
            _errorNotifier.value = _validate(value);
            widget.onChanged.call(value);
          },
          style: const TextStyle(fontSize: 16),
          textCapitalization: TextCapitalization.sentences,
          validator: _validate,
          decoration: InputDecoration(
            labelText: 'Aventura',
            fillColor: palette.cardBackground,
            helperText: 'obrigatório',
            errorText: error,
            helperStyle: TextStyle(
              fontSize: 12,
              color: palette.textDisable,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 9,
              horizontal: T20UI.spaceSize,
            ),
          ),
        );
      },
    );
  }
}
