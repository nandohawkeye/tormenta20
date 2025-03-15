import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/bottom_sheet_init_board/bottom_sheet_init_board_item.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class MenaceOptionsBottomsheet extends StatelessWidget {
  const MenaceOptionsBottomsheet({super.key});

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
                      'Essa ação não tem volta e impactará as mesas que usam essa ameaça.  Cuidado!',
                  onTap: () => Navigator.pop(
                    context,
                    MenaceOption.delete,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: BottomSheetInitBoardItem(
                  icon: FontAwesomeIcons.fileArrowDown,
                  title: 'Salvar',
                  subtitle: 'Exporte e salve essa ameaça em um local seguro',
                  onTap: () => Navigator.pop(
                    context,
                    MenaceOption.export,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: BottomSheetInitBoardItem(
                  icon: FontAwesomeIcons.peopleArrows,
                  title: 'Clonar',
                  subtitle:
                      'Copie essa ameaça para usar com outras caracteristicas ou em outra mesa',
                  onTap: () => Navigator.pop(
                    context,
                    MenaceOption.clone,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: BottomSheetInitBoardItem(
                  icon: FontAwesomeIcons.solidPenToSquare,
                  title: 'Editar',
                  subtitle:
                      'Edite essa ameaça e seus detalhes para enfrentar seus jogadores',
                  onTap: () => Navigator.pop(
                    context,
                    MenaceOption.edit,
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

enum MenaceOption { edit, clone, export, delete }
