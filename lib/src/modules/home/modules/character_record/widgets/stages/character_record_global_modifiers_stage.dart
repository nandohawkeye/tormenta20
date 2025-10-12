// ignore_for_file: unused_element_parameter, deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/bottom_sheet_change_global_modifiers.dart';
import 'package:tormenta20/src/shared/extensions/global_modifiers_ext.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';

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
              SizedBox(
                height: 48,
                child: Card(
                  child: InkWell(
                    borderRadius: T20UI.borderRadius,
                    onTap: () {
                      store.saveGlobalModifiers(globlaModifiers.erase());
                    },
                    child: const Row(
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
              ),
              T20UI.smallSpaceHeight,

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.dice),
                label: 'Bõnus de rolagem:',
                value: globlaModifiers.rool,
                onChange: (value) {
                  store.saveGlobalModifiers(
                    globlaModifiers.copyWith(newRool: value),
                  );
                },
              ),

              _GlobalModifierItem(
                icon: Assets.icons.sword.svg(color: Colors.white),
                label: 'Bõnus de ataque:',
                space: 10.0,
                value: globlaModifiers.bonusAttack,
                onChange: (value) {
                  store.saveGlobalModifiers(
                    globlaModifiers.copyWith(newBonusAttack: value),
                  );
                },
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.solidStar),
                label: 'Bõnus em perícias:',
                value: globlaModifiers.expertises,
                onChange: (value) {
                  store.saveGlobalModifiers(
                    globlaModifiers.copyWith(newExpertises: value),
                  );
                },
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.personBurst),
                label: 'Bõnus em resistências:',
                value: globlaModifiers.resistances,
                onChange: (value) {
                  store.saveGlobalModifiers(
                    globlaModifiers.copyWith(newResistances: value),
                  );
                },
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.explosion),
                label: 'Bõnus de dano:',
                value: globlaModifiers.damage,
                onChange: (value) {
                  store.saveGlobalModifiers(
                    globlaModifiers.copyWith(newDamage: value),
                  );
                },
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.userShield),
                label: 'Bõnus de defesa:',
                value: globlaModifiers.defense,
                onChange: (value) {
                  store.saveGlobalModifiers(
                    globlaModifiers.copyWith(newDefense: value),
                  );
                },
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.shirt),
                label: 'Bõnus de armadura:',
                value: globlaModifiers.bonusArmor,
                onChange: (value) {
                  store.saveGlobalModifiers(
                    globlaModifiers.copyWith(newBonusArmor: value),
                  );
                },
              ),

              _GlobalModifierItem(
                icon: const Icon(FontAwesomeIcons.shieldHalved),
                label: 'Bõnus de escudo:',
                value: globlaModifiers.bonusShield,
                onChange: (value) {
                  store.saveGlobalModifiers(
                    globlaModifiers.copyWith(newBonusShield: value),
                  );
                },
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
    required this.onChange,
  });

  final String label;
  final int value;
  final Widget icon;
  final double space;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Card(
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () async {
            BottomsheetUtils.show<int?>(
              context: context,
              child: BottomSheetChangeGlobalModifiers(
                label: label.replaceAll(':', ""),
                initialValue: value,
              ),
            ).then((result) {
              if (result != null) {
                onChange(result);
              }
            });
          },
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
      ),
    );
  }
}
