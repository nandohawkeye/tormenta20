import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/widgets/alert_bottomsheet.dart';

class BoardViewCharacterConfirmDeleteBottomsheet extends StatelessWidget {
  const BoardViewCharacterConfirmDeleteBottomsheet(
      {super.key, required this.characterName});

  final String characterName;

  @override
  Widget build(BuildContext context) {
    return AlertBottomsheet(
      label: 'Deletar $characterName',
      mainButtonLabel: 'Sim, deletar',
      mensage:
          'Deseja realmente deletar este personagem? Essa ação não pode ser desfeita e todas as informações do personagem serão perdidas.',
      onTap: () => Navigator.pop(context, true),
    );
  }
}
