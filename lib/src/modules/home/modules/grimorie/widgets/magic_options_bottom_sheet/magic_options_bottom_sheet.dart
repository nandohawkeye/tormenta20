// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class MagicOptionsBottomSheet extends StatelessWidget {
  const MagicOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionsBottomsheet<magicOptions>(
      itens: [
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidTrashCan,
          label: 'Deletar',
          mensage: 'Se você adicionou sem querer, pode remover clicando aqui!',
          type: magicOptions.delete,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidEye,
          label: 'Ver',
          mensage: 'Confira todas as informações e detalhes desta magia.',
          type: magicOptions.see,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.gear,
          label: 'Configurar',
          mensage:
              'Configure PM, CD, rolagem de dados e dano para usar nos seus combates!',
          type: magicOptions.setup,
        ),
      ],
    );
  }
}

enum magicOptions { delete, see, setup }
