// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character/character_store.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_grimoire_button.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_header_image.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_header_infos.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key, required this.initial});

  final Character initial;

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late final CharacterStore _store;

  void forcePopScreen() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _store = CharacterStore(widget.initial);
    _store.forcePopScreen = forcePopScreen;
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _store,
      builder: (_, __) {
        final character = _store.character;
        final grimoire = character.grimorie;
        return ScreenBase(
          label: character.name,
          onSaveLabel: 'Opções',
          extraRightWidgets: grimoire != null
              ? [
                  CharacterGrimoireButton(grimoire),
                  T20UI.spaceWidth,
                ]
              : [],
          // extraTopWidgets: [
          //   const Divider(),
          //   T20UI.spaceHeight,
          //   AnimatedBuilder(
          //     animation: _store,
          //     builder: (_, __) {
          //       final selected = _store.tabIndex;
          //       return MenaceTabs(
          //         selected: selected,
          //         changeTabIndex: _store.changeTabIndex,
          //       );
          //     },
          //   ),
          //   T20UI.spaceHeight,
          // ],
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Row(
                children: [
                  T20UI.smallSpaceWidth,
                  CharacterHeaderImage(character),
                  T20UI.spaceWidth,
                  CharacterHeaderInfos(character),
                ],
              ),
              T20UI.spaceHeight,
              const Divider(),
              T20UI.spaceHeight,
              // Padding(
              //   padding: T20UI.horizontallScreenPadding,
              //   child: MenaceAtributes(menace),
              // ),
              T20UI.spaceHeight,
              const Divider(),
              // MenaceValidText(value: menace.desc),
              // MenaceValidText(
              //   value: menace.extraInfos,
              //   textColor: palette.textSecundary,
              // ),
              // MenaceBoardsField(_store),
              // AnimatedBuilder(
              //   animation: _store,
              //   builder: (_, __) {
              //     final index = _store.tabIndex;

              //     if (index == 0) {
              //       return MenaceActions(menace.actions);
              //     }

              //     if (index == 1) {
              //       return MenaceSkills(menace.generalSkills);
              //     }

              //     if (index == 2) {
              //       return MenaceMagics(menace.magics);
              //     }

              //     if (index == 3) {
              //       return MenaceEquipments(menace.equipments);
              //     }

              //     return MenaceExpertises(menace.expertises);
              //   },
              // ),
              T20UI.spaceHeight,
            ],
          ),
          onSave: () async {
            // await BottomsheetUtils.show<MenaceOption?>(
            //   context: context,
            //   child: const MenaceOptionsBottomsheet(),
            // ).then((result) async {
            //   if (result == MenaceOption.edit) {
            //     callEdit(menace);
            //   }

            //   if (result == MenaceOption.delete) {
            //     callRemove();
            //   }

            //   if (result == MenaceOption.clone) {
            //     callClone(menace);
            //   }

            //   if (result == MenaceOption.export) {}
            // });
          },
        );
      },
    );
  }
}
