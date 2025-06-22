import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/utils/action_type_utils.dart';

class CharacterRecordActionsStage extends StatelessWidget {
  const CharacterRecordActionsStage(this.store, {super.key});

  final CharacterRecordStore store;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store.characterBoard,
      builder: (_, _) {
        final actions = store.characterBoard.value.actions;

        if (actions.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FontAwesomeIcons.ghost),
                  SizedBox(width: T20UI.smallSpaceSize),
                  Text('Nenhuma ação', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        }

        actions.sort((a, b) => a.name.compareTo(b.name));
        return ListView.separated(
          padding: T20UI.horizontallScreenPadding.copyWith(
            bottom: T20UI.spaceSize,
            top: T20UI.spaceSize,
          ),
          shrinkWrap: true,
          itemCount: actions.length,
          separatorBuilder: T20UI.separatorBuilderVertical,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemBuilder: (_, index) {
            return _Card(action: actions[index]);
          },
        );
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.action});

  final ActionEnt action;

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
                if (action is DistanceAttack)
                  Text(
                    'Ataque á distância',
                    style: TextStyle(
                      color: palette.accent,
                      fontFamily: FontFamily.tormenta,
                      fontSize: 20,
                    ),
                  ),
                if (action is HandToHand)
                  Text(
                    'Corpo-a-Corpo',
                    style: TextStyle(
                      color: palette.accent,
                      fontFamily: FontFamily.tormenta,
                      fontSize: 20,
                    ),
                  ),
                if ((action is! HandToHand) && (action is! DistanceAttack))
                  Text(
                    '${action.name.capitalize()} (${ActionTypeUtils.handleTitle(action.type.name)})',
                    style: TextStyle(
                      color: palette.accent,
                      fontFamily: FontFamily.tormenta,
                      fontSize: 20,
                    ),
                  ),
                const SizedBox(height: 4),
                Text(
                  '${((action is HandToHand) || (action is DistanceAttack)) ? '${action.name} - ' : ''}${action.desc}',
                  maxLines: 2000,
                ),
                if ((action.damageDices != null) ||
                    (action.extraDamageDices != null) ||
                    (action.pm != null) ||
                    (action.cd != null))
                  const SizedBox(height: 4),
                if ((action.damageDices != null) ||
                    (action.extraDamageDices != null))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        if (action.damageDices != null)
                          Text(
                            '(${action.damageDices}${(action.mediumDamageValue ?? 0) > 0 ? '+${(action.mediumDamageValue ?? 0)}' : ''}, ${action.critical ?? 20} *${action.criticalMultiplier ?? 1})',
                            style: TextStyle(color: palette.textSecundary),
                          ),
                        if (action.extraDamageDices != null)
                          Text(
                            ' +${action.extraDamageDices}',
                            style: TextStyle(color: palette.textSecundary),
                          ),
                      ],
                    ),
                  ),
                Row(
                  children: [
                    if (action.pm != null)
                      Text(
                        'PM: ${action.pm}',
                        style: TextStyle(color: palette.textSecundary),
                      ),
                    if ((action.pm != null) && (action.cd != null))
                      const SizedBox(width: 4),
                    if (action.cd != null)
                      Text(
                        'CD: ${action.cd}',
                        style: TextStyle(color: palette.textSecundary),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
