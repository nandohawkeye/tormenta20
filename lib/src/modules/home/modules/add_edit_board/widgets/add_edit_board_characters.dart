import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_character.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardCharacters extends StatelessWidget {
  const AddEditBoardCharacters(this.controller, {super.key});

  final AddEditBoardController controller;

  @override
  Widget build(BuildContext context) {
    void addEditSite(BoardCharacter? character) async {
      await showModalBottomSheet<BoardCharacter?>(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BottomSheetAddEditBoardCharacter(
            character: character,
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Personagens'),
              Row(
                children: [
                  SimpleButton(
                    icon: FontAwesomeIcons.plus,
                    onTap: () => addEditSite(null),
                  ),
                  T20UI.spaceWidth,
                  SimpleButton(
                    icon: FontAwesomeIcons.qrcode,
                    onTap: () {},
                  )
                ],
              ),
            ],
          ),
        ),
        T20UI.spaceHeight,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: T20UI.spaceSize - 4,
          ),
          child: MainButton(
            label: 'Adicionar personagem',
            backgroundColor: palette.cardBackground,
            onTap: () => addEditSite(null),
          ),
        )
      ],
    );
  }
}
