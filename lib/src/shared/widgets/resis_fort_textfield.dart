import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class ResisFortTextfield extends StatefulWidget {
  const ResisFortTextfield({
    super.key,
    this.initialValue,
    required this.onchange,
  });

  final int? initialValue;
  final Function(String?) onchange;

  @override
  State<ResisFortTextfield> createState() =>
      _BottomSheetAddBoardLinkTitleFieldState();
}

class _BottomSheetAddBoardLinkTitleFieldState
    extends State<ResisFortTextfield> {
  late final ValueNotifier<String?> _error;

  @override
  void initState() {
    super.initState();
    _error = ValueNotifier<String?>(null);
  }

  String? _validator(String? value) {
    if ((value ?? '').isEmpty) {
      return 'obrigatório';
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
          initialValue: widget.initialValue?.toString(),
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.sentences,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
          ],
          validator: _validator,
          decoration: InputDecoration(
            labelText: 'Resis. Fort.',
            fillColor: palette.backgroundLevelOne,
            helperText: 'obrigatório',
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
