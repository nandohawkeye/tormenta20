import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/shared/entities/character_conditions.dart';

class CharacterRecordConditionsStage extends StatelessWidget {
  const CharacterRecordConditionsStage(this.store, {super.key});

  final CharacterRecordStore store;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store.characterBoard,
      builder: (_, _) {
        final conditions = store.characterBoard.value.conditions;

        if (conditions.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(FontAwesomeIcons.handsPraying),
                      SizedBox(width: T20UI.spaceSize),
                      Text('Nenhuma condição', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  T20UI.spaceHeight,
                  SizedBox(
                    height: 48,
                    child: Card(
                      child: Padding(
                        padding: T20UI.horizontalPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(FontAwesomeIcons.skullCrossbones),
                            T20UI.smallSpaceWidth,
                            Text(
                              'Adicionar uma condição',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        conditions.sort((a, b) => a.name.compareTo(b.name));
        return ListView.separated(
          padding: T20UI.horizontallScreenPadding.copyWith(
            bottom: T20UI.spaceSize,
            top: T20UI.spaceSize,
          ),
          shrinkWrap: true,
          itemCount: conditions.length,
          separatorBuilder: T20UI.separatorBuilderVertical,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemBuilder: (_, index) {
            return _Card(condition: conditions[index]);
          },
        );
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.condition});

  final CharacterConditions condition;

  @override
  Widget build(BuildContext context) {
    return Text(condition.name);
  }
}
