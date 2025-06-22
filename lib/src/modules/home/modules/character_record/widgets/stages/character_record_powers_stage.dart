import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/utils/power_type_utils.dart';

class CharacterRecordPowersStage extends StatelessWidget {
  const CharacterRecordPowersStage(this.store, {super.key});

  final CharacterRecordStore store;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store.characterBoard,
      builder: (_, _) {
        final powers = store.characterBoard.value.powers;

        if (powers.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FontAwesomeIcons.ghost),
                  SizedBox(width: T20UI.smallSpaceSize),
                  Text('Nenhum poder', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        }

        powers.sort((a, b) => a.name.compareTo(b.name));
        return ListView.separated(
          padding: T20UI.horizontallScreenPadding.copyWith(
            bottom: T20UI.spaceSize,
            top: T20UI.spaceSize,
          ),
          shrinkWrap: true,
          itemCount: powers.length,
          separatorBuilder: T20UI.separatorBuilderVertical,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemBuilder: (_, index) {
            return _Card(power: powers[index]);
          },
        );
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.power});

  final Power power;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: T20UI.spaceSize,
              vertical: T20UI.smallSpaceSize,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${power.name.capitalize()} (${PowerTypeUtils.handleTitle(power.type.name)})',
                  style: TextStyle(
                    color: palette.accent,
                    fontFamily: FontFamily.tormenta,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(power.desc, maxLines: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
