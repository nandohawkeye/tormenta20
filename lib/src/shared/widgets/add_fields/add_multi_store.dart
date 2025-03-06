// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/stores/validate_store.dart';

abstract class AddMultiStore<T extends EntityBase> extends ChangeNotifier
    implements ValidateStore {
  AddMultiStore(List<T> initialValues) {
    _data.addAll(initialValues);
  }

  List<T> _data = [];
  List<T> get data => _data;
  void remove(T value) {
    _data.remove(value);
    notifyListeners();
  }

  void put(T? value) {
    if (value == null) return;

    if (_data.any((d) => d.primaryKey == value.primaryKey)) {
      final index = _data.indexWhere((d) => d.primaryKey == value.primaryKey);
      _data[index] = value;
    } else {
      _data.add(value);
    }

    hasError = false;
    notifyListeners();
  }

  void clearAll() {
    _data.clear();
    notifyListeners();
  }

  bool hasError = false;

  @override
  bool validate() {
    if (_data.isEmpty) {
      hasError = true;
      return false;
    } else {
      hasError = false;
      return true;
    }
  }
}
