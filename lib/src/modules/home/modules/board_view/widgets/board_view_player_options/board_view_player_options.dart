import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/bottom_sheet_init_board/bottom_sheet_init_board_item.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class BoardViewPlayerOptions extends StatelessWidget {
  const BoardViewPlayerOptions(this.player, {super.key});

  final BoardPlayer player;

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
                  title: 'Deletar personagem',
                  subtitle: 'Remove o personagem da exitência dessa mesa',
                  onTap: () => Navigator.pop(
                    context,
                    PlayerOptionsType.delete,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: BottomSheetInitBoardItem(
                  icon: player.isAlive
                      ? FontAwesomeIcons.skull
                      : FontAwesomeIcons.personRays,
                  title: player.isAlive
                      ? 'Personagem morreu'
                      : 'Personagem reviveu',
                  subtitle: player.isAlive
                      ? 'O personagem foi de base'
                      : 'Colocaram o clérigo pra trabalhar',
                  onTap: () => Navigator.pop(
                    context,
                    PlayerOptionsType.alive,
                  ),
                ),
              ),
              if (player.isAlive)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    T20UI.spaceHeight,
                    Padding(
                      padding: T20UI.horizontalPadding,
                      child: BottomSheetInitBoardItem(
                        icon: FontAwesomeIcons.penToSquare,
                        title: 'Editar personagem',
                        subtitle:
                            'Clique para editar as informações do personagem',
                        onTap: () => Navigator.pop(
                          context,
                          PlayerOptionsType.edit,
                        ),
                      ),
                    ),
                  ],
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

enum PlayerOptionsType { delete, alive, edit }
