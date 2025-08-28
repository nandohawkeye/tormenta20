import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_record_atributes.dart';

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
        T20UI.smallSpaceHeight,
        const Padding(
          padding: T20UI.horizontallScreenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              T20UI.smallSpaceHeight,
              SizedBox(
                height: 48,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.clockRotateLeft),
                      T20UI.smallSpaceWidth,
                      Text(
                        'Histórico completo',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              T20UI.spaceHeight,
            ],
          ),
        ),
      ],
    );
  }
}
