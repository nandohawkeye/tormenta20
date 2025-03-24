import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/widgets/delete_bottomsheet_base.dart';

class DeleteGrimorieBottomsheet extends StatelessWidget {
  const DeleteGrimorieBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeleteBottomsheetBase(
      suffix: 'grimório',
      mensage: 'Deseja realmente deletar esse grimório?',
    );
  }
}
