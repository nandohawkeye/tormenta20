import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_warning.dart';

class AddEditCharacterAddWarning extends StatelessWidget {
  const AddEditCharacterAddWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddEditCharacterWarning(
      mensage:
          'Crie seu personagem 1˚ nivel, depois vincule-o a uma mesa para upá-lo e começar a de divertir !',
    );
  }
}
