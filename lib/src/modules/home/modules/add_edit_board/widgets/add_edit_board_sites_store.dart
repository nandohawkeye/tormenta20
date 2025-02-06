import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';

class AddEditBoardSitesStore {
  AddEditBoardSitesStore(this._controller, this._scrollController) {
    sites = ValueNotifier<List<BoardLink>?>(_controller.links);
  }
  final AddEditBoardController _controller;
  final ScrollController _scrollController;

  late final ValueNotifier<List<BoardLink>?> sites;

  void add(BoardLink? value) async {
    if (value == null) {
      return;
    }

    List<BoardLink> oldValues = sites.value ?? [];

    if (oldValues.any((ov) => ov.uuid == value.uuid)) {
      final index = oldValues.indexWhere((old) => old.uuid == value.uuid);
      oldValues[index] = value;
      sites.value = null;
      sites.value = [...oldValues];
    } else {
      sites.value = null;
      sites.value = [...oldValues, value];
    }

    _controller.addLink(value);
    await Future.delayed(const Duration(milliseconds: 300)).then(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: T20UI.defaultDurationAnimation,
        curve: Curves.easeIn,
      ),
    );
  }

  void remove(BoardLink value) {
    List<BoardLink> oldValues = sites.value ?? [];
    oldValues.removeWhere((od) => od.uuid == value.uuid);
    sites.value = [...oldValues];
    _controller.removeLink(value);
  }

  dispose() => sites.dispose();
}
