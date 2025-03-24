import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class BoardViewPlayerOptions extends StatelessWidget {
  const BoardViewPlayerOptions(this.player, {super.key});

  final BoardPlayer player;

  @override
  Widget build(BuildContext context) {
    return OptionsBottomsheet<PlayerOptionsType>(
      itens: [
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidTrashCan,
          label: 'Deletar personagem',
          mensage: 'Remove o personagem da exitência dessa mesa',
          type: PlayerOptionsType.delete,
        ),
        OptionsBottomsheetEntity(
          icon: player.isAlive
              ? FontAwesomeIcons.skull
              : FontAwesomeIcons.personRays,
          label: player.isAlive ? 'Personagem morreu' : 'Personagem reviveu',
          mensage: player.isAlive
              ? 'O personagem foi de base'
              : 'Colocaram o clérigo pra trabalhar',
          type: PlayerOptionsType.alive,
        ),
        if (player.isAlive)
          OptionsBottomsheetEntity(
            icon: FontAwesomeIcons.penToSquare,
            label: 'Editar personagem',
            mensage: 'Clique para editar as informações do personagem',
            type: PlayerOptionsType.edit,
          ),
      ],
    );
  }
}

enum PlayerOptionsType { delete, alive, edit }
