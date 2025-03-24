import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/widgets/delete_bottomsheet_base.dart';

class DeleteCharacterBottomsheet extends StatelessWidget {
  const DeleteCharacterBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeleteBottomsheetBase(
      suffix: 'personagem',
      mensage:
          'Deseja realmente deletar este personagem? Ao fazer isso você não poderá adiciona-lo em mesas futuras!',
    );
  }
}
