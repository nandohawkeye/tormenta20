import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/formatters/displacement_input_formatter.dart';
import 'package:tormenta20/src/shared/utils/default_input_validator.dart';

class DisplacementTextfield extends StatefulWidget {
  const DisplacementTextfield({
    super.key,
    this.initialDisplacement,
    required this.onchange,
  });

  final double? initialDisplacement;
  final Function(String?) onchange;

  @override
  State<DisplacementTextfield> createState() =>
      _BottomSheetAddBoardLinkTitleFieldState();
}

class _BottomSheetAddBoardLinkTitleFieldState
    extends State<DisplacementTextfield> {
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
            final valueClean =
                value.replaceAll(',', '.').replaceAll('m', '').trim();
            _error.value = DefaultInputValidator.valid(valueClean);
            widget.onchange.call(valueClean);
          },
          initialValue: widget.initialDisplacement?.toString(),
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.sentences,
          inputFormatters: [DisplacementInputFormatter()],
          validator: DefaultInputValidator.valid,
          decoration: InputDecoration(
            labelText: 'Deslocamento',
            fillColor: palette.backgroundLevelOne,
            helperText: 'obrigatório',
            errorText: error,
          ),
        );
      },
    );
  }
}
