// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/add_edit_character.dart';
import 'package:tormenta20/src/modules/home/modules/character/character_store.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_actions.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_atributes.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_boards/character_board_field.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_equipments.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_grimoire_button.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_header_image.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_header_infos.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_options_bottomsheet/character_options_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_origins.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_powers.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_tabs/character_tabs.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_trained_expertises.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/delete_character_bottomsheet/delete_character_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_screen.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/entities/character_adapters.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/utils/backup_utils.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
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

  void _callEdit(Character character) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddEditCharacter(initial: character)),
    );
  }

  void _callRemove() async {
    await BottomsheetUtils.show<bool?>(
      context: context,
      child: const DeleteCharacterBottomsheet(),
    ).then((result) async {
      if (result != null && result) {
        _store.deleteCharacter();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _store,
      builder: (_, __) {
        final character = _store.character;
        final grimoire = character.grimorie;
        final tabIndexSelected = _store.tabIndex;
        final boards = _store.boards;
        return ScreenBase(
          label: character.name,
          onSaveLabel: 'Opções',
          extraRightWidgets: grimoire != null
              ? [
                  T20UI.spaceWidth,
                  CharacterGrimoireButton(
                    grimoire,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GrimorieScreen(grimoire: grimoire),
                        ),
                      );
                    },
                  ),
                ]
              : [],
          extraTopWidgets: [
            const Divider(),
            T20UI.spaceHeight,
            CharacterTabs(
              selected: tabIndexSelected,
              changeTabIndex: _store.changeTabIndex,
            ),
            T20UI.spaceHeight,
          ],
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
              Padding(
                padding: T20UI.horizontallScreenPadding,
                child: CharacterAtributes(character),
              ),
              T20UI.spaceHeight,
              const Divider(),
              CharacterBoardField(_store, character: character, boards: boards),
              if (tabIndexSelected == 0) CharacterActions(character.actions),
              if (tabIndexSelected == 1)
                CharacterEquipments(character.equipments),
              if (tabIndexSelected == 2) CharacterPowers(character.powers),
              if (tabIndexSelected == 3) CharacterOrigins(character.origins),
              if (tabIndexSelected == 4)
                CharacterTrainedExpertises(character.trainedExpertises),
              T20UI.spaceHeight,
            ],
          ),
          onSave: () async {
            await BottomsheetUtils.show<CharacterOption?>(
              context: context,
              child: const CharacterOptionsBottomsheet(),
            ).then((result) async {
              if (result == CharacterOption.edit) {
                _callEdit(character);
              }

              if (result == CharacterOption.delete) {
                _callRemove();
              }

              if (result == CharacterOption.export) {
                final data = CharacterAdapters.toExportMaster(character);

                if (data == null) return;

                final file = await BackupUtils.createTempJson(
                  data,
                  'personagem_${character.name.toLowerCase().replaceAllDiacritics().trim().replaceAll(' ', '')}',
                );

                if (file == null) return;

                Share.shareXFiles([XFile(file.path)]);
              }
            });
          },
        );
      },
    );
  }
}
