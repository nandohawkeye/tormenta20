import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/default_input_validator.dart';

class PenaltyTextfield extends StatefulWidget {
  const PenaltyTextfield({
    super.key,
    this.initialValue,
    required this.onchange,
    this.isObrigatory = true,
  });

  final int? initialValue;
  final Function(String?) onchange;
  final bool isObrigatory;

  @override
  State<PenaltyTextfield> createState() =>
      _BottomSheetAddBoardLinkTitleFieldState();
}

class _BottomSheetAddBoardLinkTitleFieldState extends State<PenaltyTextfield> {
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
          keyboardType: TextInputType.name,
          validator: widget.isObrigatory ? DefaultInputValidator.valid : null,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9-]'))
          ],
          decoration: InputDecoration(
            labelText: 'Penalidade',
            fillColor: palette.backgroundLevelOne,
            helperText: widget.isObrigatory ? 'obrigatório' : null,
            errorText: error,
          ),
        );
      },
    );
  }
}
