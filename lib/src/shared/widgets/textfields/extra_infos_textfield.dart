import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/default_input_validator.dart';

class ExtraInfosTextfield extends StatefulWidget {
  const ExtraInfosTextfield({
    super.key,
    this.initialValue,
    required this.onchange,
    this.isObrigatory = true,
  });

  final String? initialValue;
  final Function(String?) onchange;
  final bool isObrigatory;

  @override
  State<ExtraInfosTextfield> createState() =>
      _BottomSheetAddBoardLinkTitleFieldState();
}

class _BottomSheetAddBoardLinkTitleFieldState
    extends State<ExtraInfosTextfield> {
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
            if (widget.isObrigatory) {
              _error.value = DefaultInputValidator.valid(value);
            }

            widget.onchange.call(value);
          },
          initialValue: widget.initialValue,
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          validator: widget.isObrigatory ? DefaultInputValidator.valid : null,
          minLines: 1,
          maxLines: 4,
          decoration: InputDecoration(
            labelText: 'Infos. Extra',
            fillColor: palette.backgroundLevelOne,
            helperText: widget.isObrigatory ? 'obrigatório' : null,
            errorText: error,
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
