import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/bottom_sheet_init_board/bottom_sheet_init_board_item.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class BoardViewOptionsBottomsheet extends StatelessWidget {
  const BoardViewOptionsBottomsheet({super.key});

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
                  title: 'Deletar mesa',
                  subtitle:
                      'Delete a messa com todas as suas informações...isso não tem volta!',
                  onTap: () => Navigator.pop(
                    context,
                    BordViewOptionType.delete,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: BottomSheetInitBoardItem(
                  icon: FontAwesomeIcons.solidFileCode,
                  title: 'Compartilhar arquivo da mesa',
                  subtitle:
                      'Gere e compatilhe o arquivo desta mesa para os jogadores',
                  onTap: () => Navigator.pop(
                    context,
                    BordViewOptionType.json,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: BottomSheetInitBoardItem(
                  icon: FontAwesomeIcons.shareNodes,
                  title: 'Compartilhar materiais',
                  subtitle:
                      'Faça a boa para os seus amigos e compartilhe os materiais com eles',
                  onTap: () => Navigator.pop(
                    context,
                    BordViewOptionType.material,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: BottomSheetInitBoardItem(
                  icon: FontAwesomeIcons.penToSquare,
                  title: 'Editar mesa',
                  subtitle: 'Clique para editar as informações da mesa',
                  onTap: () => Navigator.pop(
                    context,
                    BordViewOptionType.edit,
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

enum BordViewOptionType { delete, json, material, edit }
