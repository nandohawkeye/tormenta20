import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_warning.dart';

class AddEditCharacterEditWarning extends StatelessWidget {
  const AddEditCharacterEditWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddEditCharacterWarning(
      mensage:
          'Ao editar esse personagem, as mesas as quais ele já está vinculado não serão afetadas!',
    );
  }
}
