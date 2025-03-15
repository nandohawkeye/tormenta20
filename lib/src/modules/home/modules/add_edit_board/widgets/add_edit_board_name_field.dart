import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/default_input_validator.dart';

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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _errorNotifier,
      builder: (_, error, __) {
        return TextFormField(
          initialValue: widget.initialValue,
          onChanged: (value) {
            _errorNotifier.value = DefaultInputValidator.valid(value);
            widget.onChanged.call(value);
          },
          textCapitalization: TextCapitalization.sentences,
          style: const TextStyle(fontSize: 16),
          validator: DefaultInputValidator.valid,
          decoration: InputDecoration(
            labelText: 'Nome da mesa',
            fillColor: palette.cardBackground,
            helperText: 'obrigatório',
            errorText: error,
          ),
        );
      },
    );
  }
}
