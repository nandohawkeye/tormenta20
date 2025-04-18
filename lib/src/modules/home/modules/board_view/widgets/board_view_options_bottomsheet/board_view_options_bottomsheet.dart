import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class BoardViewOptionsBottomsheet extends StatelessWidget {
  const BoardViewOptionsBottomsheet(this.board, {super.key});

  final Board board;

  @override
  Widget build(BuildContext context) {
    return OptionsBottomsheet<BordViewOptionType>(
      itens: [
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidTrashCan,
          label: 'Deletar mesa',
          mensage:
              'Delete a messa com todas as suas informações...isso não tem volta!',
          type: BordViewOptionType.delete,
        ),
        if (board.mode == BoardModeType.master)
          OptionsBottomsheetEntity(
            icon: FontAwesomeIcons.solidFileCode,
            label: 'Compartilhar arquivo da mesa',
            mensage: 'Gere e compatilhe o arquivo desta mesa para os jogadores',
            type: BordViewOptionType.json,
          ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.shareNodes,
          label: 'Compartilhar materiais',
          mensage:
              'Faça a boa para os seus amigos e compartilhe os materiais com eles',
          type: BordViewOptionType.material,
        ),
        if (board.mode == BoardModeType.player)
          OptionsBottomsheetEntity(
            icon: FontAwesomeIcons.solidFileCode,
            label: 'Compartilhar personagem',
            mensage: 'Gere e compatilhe o arquivo do personagem para o mestre',
            type: BordViewOptionType.json,
          ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.penToSquare,
          label: 'Editar mesa',
          mensage: 'Clique para editar as informações da mesa',
          type: BordViewOptionType.edit,
        ),
      ],
    );
  }
}

enum BordViewOptionType { delete, json, material, edit, character }
