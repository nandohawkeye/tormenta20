import 'package:flutter/services.dart';

class RemoveSymbolsInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final result = _texValueClear(newValue.text);

    return _editingValue(result);
  }

  TextEditingValue _editingValue(String value) => TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(
          offset: (value.length),
        ),
      );

  static String _texValueClear(String value) => value
      .replaceAll('.', '')
      .replaceAll('-', '')
      .replaceAll('/', '')
      .replaceAll(',', '')
      .replaceAll(' ', '');
}
