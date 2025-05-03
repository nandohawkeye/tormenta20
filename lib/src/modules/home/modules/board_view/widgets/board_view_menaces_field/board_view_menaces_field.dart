// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_menace_options_bottomsheet/baord_view_menace_options_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_menaces_field/board_view_menace_field_card_prototype.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_menaces_field/board_view_menane_field_card.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/manace_screen_button.dart';
import 'package:tormenta20/src/modules/home/modules/menace/menace_screen.dart';
import 'package:tormenta20/src/modules/home/modules/select_menaces/select_menaces_screen.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';

class BoardViewMenacesField extends StatelessWidget {
  const BoardViewMenacesField(
    this.menaces, {
    super.key,
    required this.boardUuid,
    required this.removeMenace,
  });

  final List<Menace> menaces;
  final String boardUuid;
  final Function(Menace) removeMenace;

  @override
  Widget build(BuildContext context) {
    void menaceOptions(Menace menace) async {
      await BottomsheetUtils.show<MenaceOptionsType?>(
        context: context,
        child: const BaordViewMenaceOptionsBottomsheet(),
      ).then(
        (result) {
          if (result == MenaceOptionsType.see) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MenaceScreen(
                  menace: menace,
                ),
              ),
            );
          }

          if (result == MenaceOptionsType.remove) {
            removeMenace(menace);
          }
        },
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        const Padding(
          padding: T20UI.allPadding,
          child: Labels('Ameaças'),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: T20UI.spaceSize,
            right: T20UI.screenContentSpaceSize,
            left: T20UI.screenContentSpaceSize,
          ),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ManaceScreenButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SelectMenacesScreen(
                          menaces,
                          boardUuid: boardUuid,
                        ),
                      ),
                    );
                  },
                  subtitle:
                      'Selecione ameças para usar nessa mesa e criar combates com os jogadores.',
                ),
                if (menaces.isNotEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DividerLevelTwo(verticalPadding: 0),
                      SizedBox(
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          prototypeItem:
                              const BoardViewMenaneFieldCardPrototype(),
                          itemCount: menaces.length,
                          itemBuilder: (_, index) {
                            return BoardViewMenaneFieldCard(
                              menace: menaces[index],
                              onTap: menaceOptions,
                            );
                          },
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
