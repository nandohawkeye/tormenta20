import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/default_input_validator.dart';

class LifeTextField extends StatefulWidget {
  const LifeTextField({
    super.key,
    this.initialLife,
    required this.onchange,
  });

  final int? initialLife;
  final Function(String?) onchange;

  @override
  State<LifeTextField> createState() =>
      _BottomSheetAddBoardLinkTitleFieldState();
}

class _BottomSheetAddBoardLinkTitleFieldState extends State<LifeTextField> {
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
          initialValue: widget.initialLife?.toString(),
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.sentences,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: DefaultInputValidator.valid,
          decoration: InputDecoration(
            labelText: 'Vida',
            fillColor: palette.backgroundLevelOne,
            helperText: 'obrigatório',
            errorText: error,
          ),
        );
      },
    );
  }
}
