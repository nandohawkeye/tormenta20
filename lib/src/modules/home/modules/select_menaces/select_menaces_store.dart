// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/select_menaces/select_menaces_storage_service.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:uuid/uuid.dart';

class SelectMenacesStore extends ChangeNotifier {
  SelectMenacesStore(this._boardUuid) {
    _storageService.watchMenaces().then((resp) {
      if (resp.menaces != null) {
        _subMenaces ??= resp.menaces?.listen(_setMenaces);
      }
    });
  }

  final String _boardUuid;

  StreamSubscription? _subMenaces;
  final _storageService = SelectMenacesStorageService();

  Future<Failure?> addLinkMenaceBoard() {
    List<MenaceLinkBoard> entities = [];
    for (var menace in _selectedMenaces) {
      entities.add(MenaceLinkBoard(
        uuid: const Uuid().v4(),
        boardUuid: _boardUuid,
        menaceUuid: menace.uuid,
      ));
    }

    return _storageService.addLinkMenaceBoard(entities: entities);
  }

  List<Menace> _menaces = [];
  List<Menace> get menaces => _menaces;
  void _setMenaces(List<Menace> values) {
    _menaces.clear();
    _menaces.addAll(values);
    notifyListeners();
  }

  List<Menace> _selectedMenaces = [];
  List<Menace> get selectedMenaces => _selectedMenaces;
  void setSelectedMenace(Menace value) {
    if (_selectedMenaces.contains(value)) {
      _selectedMenaces.remove(value);
    } else {
      _selectedMenaces.add(value);
    }

    notifyListeners();
  }

  @override
  void dispose() {
    _subMenaces?.cancel();
    _subMenaces = null;
    super.dispose();
  }
}
