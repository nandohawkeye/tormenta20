import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/widgets/delete_bottomsheet_base.dart';

class DeleteNoteBottomsheet extends StatelessWidget {
  const DeleteNoteBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeleteBottomsheetBase(
      suffix: 'anotação',
      mensage: 'Deseja realmente deletar essa anotação?',
    );
  }
}
