// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_banner.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_shortcuts/add_edit_board_shortcuts.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_materials/add_edit_board_materials.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_sites.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_text_field.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/widgets/screen_save_main_buttons.dart';
import 'package:tormenta20/src/shared/widgets/screen_header.dart';

class AddEditBoardScreen extends StatefulWidget {
  const AddEditBoardScreen({super.key, this.initialBoard});

  final Board? initialBoard;

  @override
  State<AddEditBoardScreen> createState() => _AddEditBoardScreenState();
}

class _AddEditBoardScreenState extends State<AddEditBoardScreen> {
  final _formKey = GlobalKey<FormState>();
  late final AddEditBoardController _controller;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = AddEditBoardController(widget.initialBoard);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenHeader(
            label:
                '${widget.initialBoard == null ? 'Criando' : 'Editando'} mesa e aventura',
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  T20UI.spaceHeight,
                  AddEditBoardTextFields(
                    formKey: _formKey,
                    controller: _controller,
                    isPlayerMode:
                        widget.initialBoard?.mode == BoardModeType.player,
                  ),
                  T20UI.spaceHeight,
                  AddEditBoardBanner(_controller),
                  T20UI.spaceHeight,
                  AddEditBoardMaterials(_controller),
                  T20UI.spaceHeight,
                  AddEditBoardShortcuts(
                    _controller,
                    scrollController: _scrollController,
                  ),
                  T20UI.spaceHeight,
                  AddEditBoardLinks(
                    _controller,
                    scrollController: _scrollController,
                  ),
                  const SizedBox(height: T20UI.spaceSize * 2),
                ],
              ),
            ),
          ),
          ScreenSaveMainButtons(
            onSave: () async {
              _scrollController.animateTo(
                _scrollController.position.minScrollExtent,
                duration: T20UI.defaultDurationAnimation,
                curve: Curves.easeIn,
              );

              if (_formKey.currentState!.validate()) {
                final board = await _controller.onSave();
                if (board != null) {
                  Navigator.pop(context, board);
                }
              }
            },
          )
        ],
      ),
    );
  }
}
