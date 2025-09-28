// ignore_for_file: unused_element_parameter, deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/change_creature_size_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/change_displacements_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/change_hand_to_hand_attack_atribute_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/change_senses_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';

class CharacterRecordActionsOthersStage extends StatelessWidget {
  const CharacterRecordActionsOthersStage(this.store, {super.key});

  final CharacterRecordStore store;

  String _atributeHandToHandLabel(Atribute atribute) {
    return switch (atribute) {
      Atribute.strength => 'FORÇA',
      Atribute.dexterity => 'DESTREZA',
      Atribute.charisma => 'CARISMA',
      Atribute.constitution => 'CONSTITUIÇÂO',
      Atribute.intelligence => 'INTELIGÊNCIA',
      Atribute.wisdom => 'SABEDORIA',
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store.characterBoard,
      builder: (_, __) {
        final character = store.characterBoard.value;
        final atribute = character.handToHandAtribute;
        return Padding(
          padding: T20UI.horizontallScreenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: T20UI.smallSpaceSize,

            children: [
              T20UI.smallSpaceHeight,
              _Item(
                icon: Assets.icons.sword.svg(color: Colors.white),
                title: _atributeHandToHandLabel(atribute),
                subtitle: 'Atributo de ataque corpo-a-corpo',
                space: 4.0,
                onTap: () async {
                  BottomsheetUtils.show<Atribute?>(
                    context: context,
                    child: ChangeHandToHandAttackAtributeBottomsheet(
                      atribute: atribute,
                    ),
                  ).then((result) async {
                    if (result == null) return;

                    await store.changeAtributeHandToHand(result);
                  });
                },
              ),
              _Item(
                icon: const Icon(FontAwesomeIcons.personArrowUpFromLine),
                title:
                    '${CreatureSizeUtils.handleTitle(character.creatureSize.name)}  ${CreatureSizeUtils.handleInfo(character.creatureSize.name)}',
                subtitle: 'Tamanho',
                onTap: () async {
                  BottomsheetUtils.show<CreatureSizeCategory?>(
                    context: context,
                    child: ChangeCreatureSizeBottomsheet(
                      initialSize: character.creatureSize,
                    ),
                  ).then((result) {
                    if (result == null) return;

                    store.changeCreatureSize(result);
                  });
                },
              ),

              _Item(
                icon: const Icon(FontAwesomeIcons.personRunning),
                title: character.displacement ?? 'Nenhum',
                subtitle: 'Deslocamento',
                onTap: () {
                  BottomsheetUtils.show<String?>(
                    context: context,
                    child: ChangeDisplacementsBottomsheet(
                      initialDisplacements: character.displacement,
                    ),
                  ).then((result) {
                    if (result == null) return;

                    store.changeDisplacement(result);
                  });
                },
              ),

              _Item(
                icon: const Icon(FontAwesomeIcons.solidEye),
                title: character.senses ?? 'Nenhum',
                subtitle: 'Sentidos',
                onTap: () {
                  BottomsheetUtils.show<String?>(
                    context: context,
                    child: ChangeSensesBottomsheet(
                      initialSenses: character.senses,
                    ),
                  ).then((result) {
                    if (result == null) return;

                    store.changeSenses(result);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
    this.space = 8.0,
  });

  final String title;
  final String subtitle;
  final Widget icon;
  final Function()? onTap;
  final double space;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            horizontal: T20UI.spaceSize,
            vertical: T20UI.smallSpaceSize,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  icon,
                  SizedBox(width: space),
                  Text(title, style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: palette.textSecundary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
