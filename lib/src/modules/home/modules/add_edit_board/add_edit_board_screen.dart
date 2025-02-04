import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller_header.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_banner.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_characters.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_shortcuts/add_edit_board_shortcuts.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_main_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_materials/add_edit_board_materials.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_sites.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_text_field.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';

class AddEditBoardScreen extends StatefulWidget {
  const AddEditBoardScreen({super.key, this.initialBoard});

  final Board? initialBoard;

  @override
  State<AddEditBoardScreen> createState() => _AddEditBoardScreenState();
}

class _AddEditBoardScreenState extends State<AddEditBoardScreen> {
  final _formKey = GlobalKey<FormState>();
  late final AddEditBoardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AddEditBoardController(widget.initialBoard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: kToolbarHeight),
          T20UI.spaceHeight,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddEditBoardControllerHeader(
                    isCreate: widget.initialBoard == null,
                  ),
                  T20UI.spaceHeight,
                  AddEditBoardTextFields(
                    formKey: _formKey,
                    controller: _controller,
                  ),
                  T20UI.spaceHeight,
                  AddEditBoardBanner(_controller),
                  T20UI.spaceHeight,
                  AddEditBoardCharacters(_controller),
                  T20UI.spaceHeight,
                  AddEditBoardMaterials(_controller),
                  T20UI.spaceHeight,
                  AddEditBoardShortcuts(_controller),
                  T20UI.spaceHeight,
                  AddEditBoardSites(_controller),
                  const SizedBox(height: T20UI.spaceSize * 2),
                ],
              ),
            ),
          ),
          AddEditBoardMainButtons(
            onSave: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}
