import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class MenaceOptionsBottomsheet extends StatelessWidget {
  const MenaceOptionsBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionsBottomsheet<MenaceOption>(
      itens: [
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidTrashCan,
          label: 'Deletar',
          mensage:
              'Essa ação não tem volta e impactará as mesas que usam essa ameaça. Cuidado!',
          type: MenaceOption.delete,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.fileArrowDown,
          label: 'Salvar',
          mensage: 'Exporte e salve essa ameaça em um local seguro',
          type: MenaceOption.export,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.peopleArrows,
          label: 'Clonar',
          mensage:
              'Copie essa ameaça para usar com outras caracteristicas ou em outra mesa',
          type: MenaceOption.clone,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidPenToSquare,
          label: 'Editar',
          mensage:
              'Edite essa ameaça e seus detalhes para enfrentar seus jogadores',
          type: MenaceOption.edit,
        ),
      ],
    );
  }
}

enum MenaceOption { edit, clone, export, delete }
