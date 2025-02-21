import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddEditBoardNameField extends StatefulWidget {
  const AddEditBoardNameField(this.onChanged, {super.key, this.initialValue});

  final Function(String) onChanged;
  final String? initialValue;

  @override
  State<AddEditBoardNameField> createState() => _AddEditBoardNameFieldState();
}

class _AddEditBoardNameFieldState extends State<AddEditBoardNameField> {
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
          textCapitalization: TextCapitalization.sentences,
          style: const TextStyle(fontSize: 16),
          validator: _validate,
          decoration: InputDecoration(
            labelText: 'Nome da mesa',
            fillColor: palette.cardBackground,
            helperText: 'Obrigatório',
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
