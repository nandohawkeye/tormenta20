import 'package:flutter/services.dart';

class DisplacementInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final result = _transform(newValue.text);

    return _editingValue(result);
  }

  TextEditingValue _editingValue(String value) => TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(
          offset: (value.length - 1),
        ),
      );

  static String _transform(String value) {
    final valueClean = _texValueClear(value);

    if (valueClean.isEmpty) {
      return 'm';
    } else {
      return '${valueClean}m';
    }
  }

  static String _texValueClear(String value) => value
      .replaceAll('.', ',')
      .replaceAll('-', '')
      .replaceAll('/', '')
      .replaceAll('m', '')
      .replaceAll(' ', '');
}
