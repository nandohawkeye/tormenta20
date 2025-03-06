// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/stores/validate_store.dart';

abstract class AddOnlyStore<T extends EntityBase> extends ChangeNotifier
    implements ValidateStore {
  AddOnlyStore(T initialValues) {
    _data = initialValues;
  }

  T? _data;
  T? get data => _data;
  void put(T? value) {
    _data = value;

    if (_data != null) {
      hasError = false;
    }

    notifyListeners();
  }

  bool hasError = false;

  @override
  bool validate() {
    if (_data == null) {
      hasError = true;
      return false;
    } else {
      hasError = false;
      return true;
    }
  }
}
