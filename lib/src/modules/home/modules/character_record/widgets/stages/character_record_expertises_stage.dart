import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/utils/atribute_utils.dart';

class CharacterRecordExpertisesStage extends StatelessWidget {
  const CharacterRecordExpertisesStage(this.store, {super.key});

  final CharacterRecordStore store;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store.characterBoard,
      builder: (_, _) {
        final expertises = store.characterBoard.value.expertises;

        if (expertises.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FontAwesomeIcons.ghost),
                  SizedBox(width: T20UI.smallSpaceSize),
                  Text('Nenhuma perícia', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        }

        expertises.sort((a, b) => a.name.compareTo(b.name));
        return ListView.separated(
          padding: T20UI.horizontallScreenPadding.copyWith(
            bottom: T20UI.spaceSize,
            top: T20UI.spaceSize,
          ),
          shrinkWrap: true,
          itemCount: expertises.length + 1,
          separatorBuilder: (_, index) => SizedBox(
            height: index == 0 ? T20UI.spaceSize : T20UI.smallSpaceSize,
          ),
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemBuilder: (_, index) {
            if (index == 0) {
              return const SizedBox(
                height: 48,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.hammer),
                      T20UI.smallSpaceWidth,
                      Text('Adicionar ofício', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              );
            }

            return _Card(expertise: expertises[index - 1]);
          },
        );
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.expertise});

  final Expertise expertise;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(
          vertical: T20UI.smallSpaceSize,
          horizontal: T20UI.spaceSize,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  expertise.isTrained
                      ? FontAwesomeIcons.solidStar
                      : FontAwesomeIcons.star,
                  color: expertise.isTrained ? Colors.yellow : palette.disable,
                ),
                T20UI.spaceWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(expertise.name.capitalize()),
                    Text(
                      AtributeUtils.handleTitle(expertise.atribute.name),
                      style: TextStyle(
                        fontSize: 12,
                        color: palette.textSecundary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              '4',
              style: TextStyle(fontFamily: FontFamily.tormenta, fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}
