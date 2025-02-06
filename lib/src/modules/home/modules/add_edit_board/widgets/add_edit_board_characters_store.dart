import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';

class AddEditBoardCharactersStore {
  AddEditBoardCharactersStore(this._controller) {
    players = ValueNotifier<List<BoardPlayer>?>(_controller.players);
  }

  final AddEditBoardController _controller;
  late final ValueNotifier<List<BoardPlayer>?> players;

  void addPlayer(BoardPlayer? value) {
    if (value == null) {
      return;
    }

    _controller.addPlayer(value);

    List<BoardPlayer> oldValues = players.value ?? [];

    if (oldValues.any((c) => c.uuid == value.uuid)) {
      final index = oldValues.indexWhere((c) => c.uuid == value.uuid);
      oldValues[index] = value;
      players.value = [...oldValues];
    } else {
      players.value = [...oldValues, value];
    }
  }

  void remove(BoardPlayer value) {
    _controller.removePlayer(value);
    List<BoardPlayer> oldValues = players.value ?? [];
    oldValues.removeWhere((c) => c.uuid == value.uuid);
    players.value = [...oldValues];
  }

  dispose() => players.dispose();
}
