import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class CharacterOptionsBottomsheet extends StatelessWidget {
  const CharacterOptionsBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionsBottomsheet<CharacterOption>(
      itens: [
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidTrashCan,
          label: 'Deletar',
          mensage:
              'Essa ação não tem volta, você não poderá adiciona-lo em novas mesas.',
          type: CharacterOption.delete,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.shareNodes,
          label: 'Compartilhar',
          mensage:
              'Compartilhe o personagem para o mestre adiciona-lo a mesa, facilite a vida dele :)',
          type: CharacterOption.export,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidPenToSquare,
          label: 'Editar',
          mensage:
              'Edite esse personagem e seus detalhes para enfrentar as ameaças',
          type: CharacterOption.edit,
        ),
      ],
    );
  }
}

enum CharacterOption { edit, export, delete }
