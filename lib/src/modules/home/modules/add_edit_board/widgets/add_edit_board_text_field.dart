import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_adventure_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_desc_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_level_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_name_field.dart';

class AddEditBoardTextFields extends StatelessWidget {
  const AddEditBoardTextFields({
    super.key,
    required this.formKey,
    required this.controller,
    required this.isPlayerMode,
  });

  final GlobalKey<FormState> formKey;
  final AddEditBoardController controller;
  final bool isPlayerMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RepaintBoundary(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: T20UI.screenContentSpaceSize,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AddEditBoardNameField(
                          controller.changeName,
                          initialValue: controller.name,
                        ),
                      ),
                      if (!isPlayerMode) T20UI.spaceWidth,
                      if (!isPlayerMode)
                        Expanded(
                          child: AddEditBoardLevelField(
                            controller.changeLevel,
                            initialValue: controller.level.toString(),
                          ),
                        )
                    ],
                  ),
                ),
                T20UI.spaceHeight,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: T20UI.screenContentSpaceSize,
                  ),
                  child: AddEditBoardAdventureField(
                    controller.changeAdventure,
                    initialValue: controller.adventure,
                  ),
                ),
              ],
            ),
          ),
        ),
        T20UI.spaceHeight,
        RepaintBoundary(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: T20UI.screenContentSpaceSize,
            ),
            child: AddEditBoardDescField(
              controller.changeDesc,
              initialValue: controller.desc,
            ),
          ),
        ),
      ],
    );
  }
}
