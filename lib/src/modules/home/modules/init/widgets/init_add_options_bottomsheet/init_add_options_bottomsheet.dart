import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class InitAddOptionsBottomsheet extends StatelessWidget {
  const InitAddOptionsBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionsBottomsheet<InitAddOptions>(
      itens: [
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.dungeon,
          label: 'Mesa/Aventura',
          mensage:
              'Sou um mestre e quero criar uma mesa pra me divertir com a galera',
          type: InitAddOptions.board,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.ghost,
          label: 'Ameaça',
          mensage:
              'Sou um mestre e quero criar uma ameaça pra dar TPK no grupo...hahaha!',
          type: InitAddOptions.menace,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.personHiking,
          label: 'Personagem',
          mensage:
              'Sou um jogador e vou criar um personagem para frustrar os planos do mestre :)',
          type: InitAddOptions.character,
        ),
      ],
    );
  }
}

enum InitAddOptions { board, character, menace }
