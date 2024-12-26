// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_service.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

class MagicsStore extends ChangeNotifier {
  final MagicsService _service = MagicsService();

  List<Magic> _magics = [];
  List<Magic> get magics => _magics
      .where((m) => m.name
          .toLowerCase()
          .replaceAllDiacritics()
          .contains(_searchFilter.toLowerCase().replaceAllDiacritics()))
      .toList();

  bool _searchEnable = false;
  bool get searchEnable => _searchEnable;
  void changeSearchEnable(bool value) {
    _searchEnable = value;
    if (!value) {
      _searchFilter = '';
    }

    notifyListeners();
  }

  String _searchFilter = '';
  String get searchFilter => _searchFilter;
  void changeSearchFilter(String? value) {
    if (value == null) {
      return;
    }

    _searchFilter = value;
    notifyListeners();
  }

  void init() {
    _magics.addAll(_service.getAllMagics());
  }
}
