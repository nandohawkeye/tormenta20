import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/widgets/delete_bottomsheet_base.dart';

class ConfirmDeleteBoardBottomsheet extends StatelessWidget {
  const ConfirmDeleteBoardBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeleteBottomsheetBase(
      suffix: 'mesa',
      mensage:
          'Deseja realmente deletar essa mesa? Essa ação irá deletar ela e as informações dela permanentemente',
    );
  }
}
