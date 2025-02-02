import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

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
          initialValue: widget.initialValue ?? '1',
          onChanged: (value) {
            _errorNotifier.value = _validate(value);
            widget.onChanged.call(value);
          },
          style: const TextStyle(fontSize: 16),
          validator: _validate,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: 'Nivel',
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
