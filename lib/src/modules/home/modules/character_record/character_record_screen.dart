import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_grimoire_button.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_record_atributes.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_record_image.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_record_indicators.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_record_info.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_record_other_infos_list.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_record_tabs.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class CharacterRecordScreen extends StatefulWidget {
  const CharacterRecordScreen({super.key, required this.character});

  final CharacterBoard character;

  @override
  State<CharacterRecordScreen> createState() => _CharacterRecordScreenState();
}

class _CharacterRecordScreenState extends State<CharacterRecordScreen> {
  late final CharacterRecordStore _store;

  @override
  void initState() {
    super.initState();
    _store = CharacterRecordStore(widget.character);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      onSaveLabel: 'Opções',
      onSave: () {},
      extraRightWidgets: [
        ListenableBuilder(
          listenable: _store.characterBoard,
          builder: (_, _) {
            final grimorie = _store.characterBoard.value.grimorie;

            if (grimorie == null) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.only(left: T20UI.spaceSize),
              child: CharacterGrimoireButton(grimorie, onTap: () {}),
            );
          },
        ),
      ],
      extraTopWidgets: [
        const Divider(),
        T20UI.smallSpaceHeight,
        ListenableBuilder(
          listenable: _store.tabIndex,
          builder: (_, __) {
            return CharacterRecordTabs(
              selected: _store.tabIndex.value,
              changeTabIndex: _store.changeTabIndex,
            );
          },
        ),
        T20UI.smallSpaceHeight,
      ],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: kToolbarHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CharacterRecordImage(_store.characterBoard),
              T20UI.spaceWidth,
              CharacterRecordInfo(_store.characterBoard),
            ],
          ),
          const SizedBox(height: T20UI.spaceSize * 2),
          CharacterRecordIndicators(_store),
          T20UI.spaceHeight,
          const Divider(),
          T20UI.spaceHeight,
          CharacterRecordAtributes(_store.characterBoard),
          T20UI.spaceHeight,
          const Divider(),
          T20UI.spaceHeight,
          CharacterRecordOtherInfosList(_store.characterBoard),
        ],
      ),
    );
  }
}
