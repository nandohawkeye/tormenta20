import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class BottomSheetInitBoard extends StatelessWidget {
  const BottomSheetInitBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionsBottomsheet<BoardModeType>(
      itens: [
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.plus,
          label: 'Criar',
          mensage:
              'Sou um mestre e quero criar uma mesa para me divertir com a galera!',
          type: BoardModeType.master,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidFileCode,
          label: 'Vincular usando arquivo',
          mensage:
              'Sou um jogador e quero me vincula a uma mesa usando um arquivo enviado',
          type: BoardModeType.player,
        ),
      ],
    );
  }
}
