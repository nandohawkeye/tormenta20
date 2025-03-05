import 'package:flutter/cupertino.dart';

abstract class SelectorOnlyStore<T> extends ChangeNotifier {
  SelectorOnlyStore(T? initialValue) {
    if (initialValue != null) {
      _data = initialValue;
    }
  }

  T? _data;
  T? get data => _data;
  void onChange(T? value) {
    _data = value;
    if (_data != null) {
      _hasError = false;
    }

    notifyListeners();
  }

  bool _hasError = false;
  bool get hasError => _hasError;

  bool validate() {
    if (_data == null) {
      _hasError = true;
      notifyListeners();
      return false;
    } else {
      _hasError = false;
      notifyListeners();
      return true;
    }
  }

  void reset() {
    _hasError = false;
    _data = null;
  }
}
