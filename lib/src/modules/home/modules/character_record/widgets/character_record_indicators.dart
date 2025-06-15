import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_indicator.dart';

class CharacterRecordIndicators extends StatelessWidget {
  const CharacterRecordIndicators(this._store, {super.key});

  final CharacterRecordStore _store;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ListenableBuilder(
        listenable: Listenable.merge([
          _store.life,
          _store.mana,
          _store.characterBoard,
        ]),
        builder: (_, __) {
          final character = _store.characterBoard.value;
          final life = _store.life.value;
          final mana = _store.mana.value;
          return Padding(
            padding: T20UI.horizontalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CharacterIndicator(
                  color: palette.life,
                  icon: FontAwesomeIcons.solidHeart,
                  currentValue: life,
                  totalValue: character.life,
                ),
                const SizedBox(width: 40),
                CharacterIndicator(
                  color: palette.backgroundLevelThree,
                  icon: FontAwesomeIcons.shieldHalved,
                  currentValue: 5,
                  totalValue: character.defense,
                  isUniqueValue: true,
                ),
                const SizedBox(width: 40),
                CharacterIndicator(
                  color: palette.mana,
                  icon: FontAwesomeIcons.handSparkles,
                  currentValue: mana,
                  totalValue: character.mana,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
