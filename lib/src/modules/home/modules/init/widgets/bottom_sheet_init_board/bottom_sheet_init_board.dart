import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/bottom_sheet_init_board/bottom_sheet_init_board_item.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class BottomSheetInitBoard extends StatelessWidget {
  const BottomSheetInitBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: T20UI.spaceSize,
        right: T20UI.spaceSize,
        bottom: MediaQuery.of(context).padding.bottom + T20UI.spaceSize,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: palette.bottomSheetBackground,
            borderRadius: T20UI.borderRadius),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontalPadding,
              child: BottomSheetInitBoardItem(
                icon: FontAwesomeIcons.plus,
                title: 'Criar',
                subtitle: 'Sou um mestre e quero criar uma mesa',
                onTap: () => Navigator.pop(
                  context,
                  BoardModeType.master,
                ),
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontalPadding,
              child: BottomSheetInitBoardItem(
                icon: FontAwesomeIcons.solidFileCode,
                title: 'Vincular usando arquivo',
                subtitle:
                    'Sou um jogador e quero me vincula a uma mesa usando um arquivo enviado',
                onTap: () => Navigator.pop(
                  context,
                  BoardModeType.player,
                ),
              ),
            ),
            T20UI.spaceHeight,
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BottomSheetDivider(verticalPadding: 0),
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
    );
  }
}
