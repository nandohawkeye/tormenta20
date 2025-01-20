import 'package:flutter/material.dart';

import 'package:tormenta20/src/modules/home/modules/init/widgets/init_board_field.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/init_character_field.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/init_menace_field.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InitCharacterField(),
            InitBoardField(),
            InitMenaceField(),
          ],
        ),
      ),
    );
  }
}
