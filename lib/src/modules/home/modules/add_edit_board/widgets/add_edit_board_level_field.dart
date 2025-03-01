import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/default_input_validator.dart';

class AddEditBoardLevelField extends StatefulWidget {
  const AddEditBoardLevelField(this.onChanged, {super.key, this.initialValue});

  final Function(String) onChanged;
  final String? initialValue;

  @override
  State<AddEditBoardLevelField> createState() => _BoardNameFieldState();
}

class _BoardNameFieldState extends State<AddEditBoardLevelField> {
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
          initialValue: widget.initialValue ?? '1',
          onChanged: (value) {
            _errorNotifier.value = DefaultInputValidator.valid(value);
            widget.onChanged.call(value);
          },
          style: const TextStyle(fontSize: 16),
          validator: DefaultInputValidator.valid,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: 'Nivel',
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
