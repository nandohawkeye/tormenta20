// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class GrimorieOptionsBottomsheet extends StatelessWidget {
  const GrimorieOptionsBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionsBottomsheet<grimorieOption>(
      itens: [
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidTrashCan,
          label: 'Deletar',
          mensage:
              'Quero deletar esse grimório...cuidado, não tem volta e pode afetar o combate dos persongens vinculados',
          type: grimorieOption.delete,
        ),
        OptionsBottomsheetEntity(
          icon: FontAwesomeIcons.solidPenToSquare,
          label: 'Editar',
          mensage:
              'Quero editar os detalhes deste grimório e/ou colocar um icone mais legal :)',
          type: grimorieOption.edit,
        ),
      ],
    );
  }
}

enum grimorieOption { delete, edit }
