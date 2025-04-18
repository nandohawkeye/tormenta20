import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class BoardViewCharacterOptionsBottomsheet extends StatelessWidget {
  const BoardViewCharacterOptionsBottomsheet(this.character, {super.key});

  final CharacterBoard character;

  @override
  Widget build(BuildContext context) {
    return OptionsBottomsheet<CharacterOptionsType>(
      itens: [
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidTrashCan,
          label: 'Deletar personagem',
          mensage: 'Remove o personagem da exitência dessa mesa',
          type: CharacterOptionsType.delete,
        ),
        OptionsBottomsheetEntity(
          icon: character.isAlive
              ? FontAwesomeIcons.skull
              : FontAwesomeIcons.personRays,
          label: character.isAlive ? 'Personagem morreu' : 'Personagem reviveu',
          mensage: character.isAlive
              ? 'O personagem foi de base'
              : 'Colocaram o clérigo pra trabalhar',
          type: CharacterOptionsType.alive,
        ),
        if (character.isAlive)
          OptionsBottomsheetEntity(
            icon: FontAwesomeIcons.penToSquare,
            label: 'Editar personagem',
            mensage: 'Clique para editar as informações do personagem',
            type: CharacterOptionsType.edit,
          ),
      ],
    );
  }
}

enum CharacterOptionsType { delete, alive, edit }
