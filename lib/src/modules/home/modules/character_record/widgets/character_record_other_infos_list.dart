// ignore_for_file: unused_element_parameter

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';

class CharacterRecordOtherInfosList extends StatelessWidget {
  const CharacterRecordOtherInfosList(this.characterBoard, {super.key});

  final ValueListenable<CharacterBoard> characterBoard;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ListenableBuilder(
        listenable: characterBoard,
        builder: (_, __) {
          final character = characterBoard.value;
          return SizedBox(
            height: 54,
            child: ListView(
              padding: const EdgeInsets.only(
                left: T20UI.spaceSize,
                right: T20UI.smallSpaceSize,
              ),
              scrollDirection: Axis.horizontal,
              children: [
                if (character.inTwoHands != null)
                  _Item(
                    icon: const Icon(FontAwesomeIcons.hands, size: 14),
                    title: 'Espada longa',
                    subtitle: 'Duas mãos',
                    onTap: () {},
                  ),
                //TODO implementar o campo de dorso
                _Item(
                  icon: const Icon(FontAwesomeIcons.shirt, size: 14),
                  title: 'Armadura pesada',
                  subtitle: 'Dorso',
                  onTap: () {},
                ),
                if (character.inLeftHand != null)
                  _Item(
                    icon: Transform.rotate(
                      angle: 2,
                      child: Transform.flip(
                        flipY: true,
                        child: const Icon(
                          FontAwesomeIcons.solidHandBackFist,
                          size: 14,
                        ),
                      ),
                    ),
                    title: 'Escudo',
                    subtitle: 'Mão esquerda',
                    onTap: () {},
                  ),
                if (character.inRightHand != null)
                  _Item(
                    icon: Transform.rotate(
                      angle: 1,
                      child: const Icon(
                        FontAwesomeIcons.solidHandBackFist,
                        size: 14,
                      ),
                    ),
                    title: 'Machado de guerra',
                    subtitle: 'Mão direita',
                    onTap: () {},
                  ),

                _Item(
                  icon: const Icon(
                    FontAwesomeIcons.personArrowUpFromLine,
                    size: 14,
                  ),
                  title:
                      '${CreatureSizeUtils.handleTitle(character.creatureSize.name)}  ${CreatureSizeUtils.handleInfo(character.creatureSize.name)}',
                  subtitle: 'Tamanho',
                  onTap: () {},
                ),

                _Item(
                  icon: const Icon(FontAwesomeIcons.personRunning, size: 14),
                  title: character.displacement ?? 'Nenhum',
                  subtitle: 'Deslocamento',
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final Widget icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: T20UI.smallSpaceSize),
      child: Card(
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
                Row(children: [icon, const SizedBox(width: 8), Text(title)]),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: palette.textSecundary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
