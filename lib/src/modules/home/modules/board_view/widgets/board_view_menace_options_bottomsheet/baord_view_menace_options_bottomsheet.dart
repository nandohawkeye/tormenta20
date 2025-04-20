import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class BaordViewMenaceOptionsBottomsheet extends StatelessWidget {
  const BaordViewMenaceOptionsBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionsBottomsheet<MenaceOptionsType>(
      itens: [
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidTrashCan,
          label: 'Remover ameaça',
          mensage: 'Essa ameça já deu oque tinha que dar',
          type: MenaceOptionsType.remove,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidEye,
          label: 'Ver ameaça',
          mensage: 'Confira as informações da ameaça',
          type: MenaceOptionsType.see,
        ),
      ],
    );
  }
}

enum MenaceOptionsType { remove, see }
