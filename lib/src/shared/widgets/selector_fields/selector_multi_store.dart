// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';

abstract class SelectorMultiStore<T> extends ChangeNotifier {
  SelectorMultiStore(List<T> inicialValue) {
    if (inicialValue.isNotEmpty) {
      _data.addAll(inicialValue);
    }
  }

  List<T> _data = [];
  List<T> get data => _data;
  void put(T value) {
    if (data.contains(value)) {
      if (value is Enum) {
        remove(value);
      }

      if (value is EntityBase) {
        final int index = (data as List<EntityBase>)
            .indexWhere((d) => d.primaryKey == value.primaryKey);
        data[index] = value;
      }
    } else {
      data.add(value);
    }

    if (_data.isNotEmpty) {
      _hasError = false;
    }

    notifyListeners();
  }

  void putAllAndClear(List<T> values) {
    _data.clear();
    _data.addAll(values);
    _hasError = false;

    notifyListeners();
  }

  void remove(T value) {
    _data.remove(value);

    notifyListeners();
  }

  void removeAll() {
    _data.clear();

    notifyListeners();
  }

  bool _hasError = false;
  bool get hasError => _hasError;

  bool validate() {
    if (_data.isEmpty) {
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
    _data.clear();
  }
}
