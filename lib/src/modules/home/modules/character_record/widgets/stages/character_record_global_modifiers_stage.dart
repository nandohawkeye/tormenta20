// ignore_for_file: unused_element_parameter, deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';

class CharacterRecordGlobalModifiersStage extends StatelessWidget {
  const CharacterRecordGlobalModifiersStage(this.store, {super.key});

  final CharacterRecordStore store;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store.characterBoard,
      builder: (_, _) {
        final globlaModifiers = store.characterBoard.value.globalModifiers;

        if (globlaModifiers == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: T20UI.spaceSize,
            horizontal: T20UI.screenContentSpaceSize,
          ),
          child: Column(
            spacing: T20UI.smallSpaceSize,
            children: [
              const SizedBox(
                height: 48,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.eraser),
                      T20UI.smallSpaceWidth,
                      Text(
                        'Limpar modificadores',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              T20UI.smallSpaceHeight,

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.dice),
                label: 'Bõnus de rolagem:',
                value: globlaModifiers.rool,
              ),

              _GlobalModifierItem(
                icon: Assets.icons.sword.svg(color: Colors.white),
                label: 'Bõnus de ataque:',
                space: 10.0,
                value: globlaModifiers.bonusAttack,
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.solidStar),
                label: 'Bõnus em perícias:',
                value: globlaModifiers.expertises,
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.personBurst),
                label: 'Bõnus em resistências:',
                value: globlaModifiers.resistances,
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.explosion),
                label: 'Bõnus de dano:',
                value: globlaModifiers.damage,
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.userShield),
                label: 'Bõnus de defesa:',
                value: globlaModifiers.defense,
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.shirt),
                label: 'Bõnus de armadura:',
                value: globlaModifiers.bonusArmor,
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.shieldHalved),
                label: 'Bõnus de escudo:',
                value: globlaModifiers.bonusShield,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GlobalModifierItem extends StatelessWidget {
  const _GlobalModifierItem({
    required this.label,
    required this.value,
    required this.icon,
    this.space = T20UI.spaceSize,
  });

  final String label;
  final int value;
  final Widget icon;
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Card(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            horizontal: T20UI.spaceSize,
          ),
          child: Row(
            children: [
              icon,
              SizedBox(width: space),
              Text('$label  $value', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
