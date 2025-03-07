import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/default_input_validator.dart';

class FinalValueTextfield extends StatefulWidget {
  const FinalValueTextfield({
    super.key,
    this.initialValue,
    required this.onchange,
    this.fillColor,
    this.isObrigatory = false,
  });

  final int? initialValue;
  final Function(String?) onchange;
  final Color? fillColor;
  final bool isObrigatory;

  @override
  State<FinalValueTextfield> createState() => _FinalValueTextfieldState();
}

class _FinalValueTextfieldState extends State<FinalValueTextfield> {
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
          initialValue: widget.initialValue?.toString(),
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.sentences,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: DefaultInputValidator.valid,
          decoration: InputDecoration(
            labelText: 'Valor',
            fillColor: widget.fillColor,
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
