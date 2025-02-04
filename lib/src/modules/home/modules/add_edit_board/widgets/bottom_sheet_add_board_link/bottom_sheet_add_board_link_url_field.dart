import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

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

  String? _validator(String? value) {
    if ((value ?? '').isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
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
            _error.value = _validator(value);
            widget.onchange.call(value);
          },
          initialValue: widget.initialTitle,
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.none,
          validator: _validator,
          decoration: InputDecoration(
            labelText: 'URL',
            errorText: error,
            fillColor: palette.onBottomsheet,
            helperText: 'obrigatório',
            helperStyle: TextStyle(color: palette.textDisable),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: T20UI.spaceSize,
            ),
          ),
        );
      },
    );
  }
}
