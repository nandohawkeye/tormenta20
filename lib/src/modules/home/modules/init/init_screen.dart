// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/board_view_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/init_board_field.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/init_character_field.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/init_menace_field.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SimpleButton(
        icon: FontAwesomeIcons.plus,
        backgroundColor: palette.selected,
        iconColor: palette.onSelected,
        onTap: () async {
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
