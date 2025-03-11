// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/bottom_sheet_init_board/bottom_sheet_init_board_item.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class MagicOptionsBottomSheet extends StatelessWidget {
  const MagicOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Padding(
        padding: EdgeInsets.only(
          left: T20UI.spaceSize,
          right: T20UI.spaceSize,
          bottom: MediaQuery.of(context).padding.bottom + T20UI.spaceSize,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: palette.backgroundLevelOne,
              borderRadius: T20UI.borderRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: BottomSheetInitBoardItem(
                  icon: FontAwesomeIcons.solidTrashCan,
                  title: 'Deletar',
                  subtitle:
                      'Se você adicionou sem querer, pode remover clicando aqui!',
                  onTap: () => Navigator.pop(
                    context,
                    magicOptions.delete,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: BottomSheetInitBoardItem(
                  icon: FontAwesomeIcons.solidEye,
                  title: 'Ver',
                  subtitle:
                      'Confira todas as informações e detalhes desta magia.',
                  onTap: () => Navigator.pop(
                    context,
                    magicOptions.see,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: BottomSheetInitBoardItem(
                  icon: FontAwesomeIcons.gear,
                  title: 'Configurar',
                  subtitle:
                      'Configure PM, CD, rolagem de dados e dano para usar nos seus combates!',
                  onTap: () => Navigator.pop(
                    context,
                    magicOptions.setup,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DividerLevelTwo(verticalPadding: 0),
                  Padding(
                    padding: T20UI.allPadding,
                    child: Row(
                      children: [
                        Expanded(
                          child: MainButton(
                            label: 'Voltar',
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum magicOptions { delete, see, setup }
