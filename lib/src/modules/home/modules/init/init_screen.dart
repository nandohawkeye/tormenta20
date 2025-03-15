// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_screen.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/board_view_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/init_add_options_bottomsheet/init_add_options_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/init_board_field.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/init_character_field.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/init_menace_field.dart';
import 'package:tormenta20/src/modules/home/modules/menace/menace_screen.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void callBoard() async {
      await Navigator.push<Board?>(
        context,
        MaterialPageRoute(
          builder: (_) => const AddEditBoardScreen(),
        ),
      ).then((board) {
        if (board != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BoardViewScreen(initial: board),
            ),
          );
        }
      });
    }

    void callMenace() async {
      Navigator.push<Menace?>(
        context,
        MaterialPageRoute(
          builder: (_) => const AddEditMenaceScreen(),
        ),
      ).then((result) {
        if (result != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MenaceScreen(
                menace: result,
              ),
            ),
          );
        }
      });
    }

    void callCharacter() async {}

    return Scaffold(
      floatingActionButton: SimpleButton(
        icon: FontAwesomeIcons.plus,
        backgroundColor: palette.selected,
        iconColor: palette.onSelected,
        onTap: () async {
          await BottomsheetUtils.show<InitAddOptions?>(
            context: context,
            child: const InitAddOptionsBottomsheet(),
          ).then((result) {
            if (result == InitAddOptions.board) {
              callBoard();
            }

            if (result == InitAddOptions.menace) {
              callMenace();
            }

            if (result == InitAddOptions.character) {
              callCharacter();
            }
          });
        },
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InitBoardField(),
            InitCharacterField(),
            InitMenaceField(),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
