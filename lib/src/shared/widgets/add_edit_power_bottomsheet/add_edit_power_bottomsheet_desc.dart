import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/default_input_validator.dart';

class AddEditPowerBottomsheetDesc extends StatefulWidget {
  const AddEditPowerBottomsheetDesc({
    super.key,
    this.initialDesc,
    required this.onchange,
  });

  final String? initialDesc;
  final Function(String?) onchange;

  @override
  State<AddEditPowerBottomsheetDesc> createState() =>
      _BottomSheetAddBoardLinkTitleFieldState();
}

class _BottomSheetAddBoardLinkTitleFieldState
    extends State<AddEditPowerBottomsheetDesc> {
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
          initialValue: widget.initialDesc,
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.name,
          minLines: 1,
          maxLines: 4,
          textCapitalization: TextCapitalization.sentences,
          validator: DefaultInputValidator.valid,
          decoration: InputDecoration(
            labelText: 'Descrição',
            fillColor: palette.backgroundLevelOne,
            helperText: 'obrigatório',
            errorText: error,
          ),
        );
      },
    );
  }
}
