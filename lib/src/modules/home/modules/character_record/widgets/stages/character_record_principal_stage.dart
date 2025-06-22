import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_record_atributes.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_record_other_infos_list.dart';

class CharacterRecordPrincipalStage extends StatelessWidget {
  const CharacterRecordPrincipalStage(this.store, {super.key});

  final CharacterRecordStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        CharacterRecordAtributes(store.characterBoard),
        T20UI.spaceHeight,
        const Divider(),
        T20UI.spaceHeight,
        CharacterRecordOtherInfosList(store.characterBoard),
      ],
    );
  }
}
