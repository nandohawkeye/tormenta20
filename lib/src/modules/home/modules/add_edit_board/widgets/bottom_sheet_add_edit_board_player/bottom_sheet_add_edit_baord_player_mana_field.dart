import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class BottomSheetAddEditBoardPlayerManaField extends StatefulWidget {
  const BottomSheetAddEditBoardPlayerManaField({
    super.key,
    this.initialMana,
    required this.onchange,
  });

  final int? initialMana;
  final Function(String?) onchange;

  @override
  State<BottomSheetAddEditBoardPlayerManaField> createState() =>
      _BottomSheetAddBoardLinkTitleFieldState();
}

class _BottomSheetAddBoardLinkTitleFieldState
    extends State<BottomSheetAddEditBoardPlayerManaField> {
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
          initialValue: widget.initialMana?.toString(),
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.sentences,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: _validator,
          decoration: InputDecoration(
            labelText: 'Mana',
            fillColor: palette.backgroundLevelTwo,
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
