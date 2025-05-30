import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/default_input_validator.dart';

class InitiativeTextfield extends StatefulWidget {
  const InitiativeTextfield({
    super.key,
    this.initialInitiative,
    required this.onchange,
  });

  final int? initialInitiative;
  final Function(String?) onchange;

  @override
  State<InitiativeTextfield> createState() =>
      _BottomSheetAddBoardLinkTitleFieldState();
}

class _BottomSheetAddBoardLinkTitleFieldState
    extends State<InitiativeTextfield> {
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
          initialValue: widget.initialInitiative?.toString(),
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.sentences,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: DefaultInputValidator.valid,
          decoration: InputDecoration(
            labelText: 'Iniciativa',
            fillColor: palette.backgroundLevelOne,
            helperText: 'obrigatório',
            errorText: error,
          ),
        );
      },
    );
  }
}
