import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/default_input_validator.dart';

class BottomSheetAddBoardLinkURLField extends StatefulWidget {
  const BottomSheetAddBoardLinkURLField({
    super.key,
    this.initialTitle,
    required this.onchange,
  });

  final String? initialTitle;
  final Function(String?) onchange;

  @override
  State<BottomSheetAddBoardLinkURLField> createState() =>
      _BottomSheetAddBoardLinkTitleFieldState();
}

class _BottomSheetAddBoardLinkTitleFieldState
    extends State<BottomSheetAddBoardLinkURLField> {
  late final ValueNotifier<String?> _error;

  @override
  void initState() {
    super.initState();
    _error = ValueNotifier<String?>(null);
  }

  @override
  void dispose() {
    _error.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _error,
      builder: (_, error, __) {
        return TextFormField(
          onChanged: (value) {
            _error.value = DefaultInputValidator.valid(value);
            widget.onchange.call(value);
          },
          initialValue: widget.initialTitle,
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.none,
          validator: DefaultInputValidator.valid,
          decoration: InputDecoration(
            labelText: 'URL',
            errorText: error,
            fillColor: palette.backgroundLevelOne,
            helperText: 'obrigatório',
          ),
        );
      },
    );
  }
}
