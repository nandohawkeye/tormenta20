import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/add_edit_action_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/widgets/add_edit_action_type_attack_action_selector_card.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';

class AddEditAttackActionTypeActionSelector extends StatelessWidget {
  const AddEditAttackActionTypeActionSelector({super.key, required this.store});

  final AddEditActionStore store;

  void _changeType(Type type) => store.changeAttackActionType(type);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontalPadding,
      child: Card(
        color: palette.backgroundLevelOne,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: T20UI.spaceSize,
                top: T20UI.spaceSize / 2,
                bottom: T20UI.spaceSize / 2,
              ),
              child: Text('Ataque'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: T20UI.spaceSize / 2,
                right: T20UI.spaceSize / 2,
                bottom: T20UI.spaceSize / 2,
              ),
              child: SizedBox(
                height: T20UI.inputHeight,
                child: ValueListenableBuilder(
                  valueListenable: store.actionClassType,
                  builder: (_, selected, __) {
                    return Row(
                      children: [
                        SimpleButton(
                          icon: FontAwesomeIcons.xmark,
                          backgroundColor: palette.backgroundLevelTwo,
                          iconColor: palette.accent,
                          onTap: () => _changeType(ActionEnt),
                        ),
                        const SizedBox(width: T20UI.spaceSize / 2),
                        Expanded(
                          child: AddEditActionTypeAttackActionSelectorCard(
                            value: HandToHand,
                            label: 'Corpo-a-corpo',
                            onTap: _changeType,
                            valueSelected: selected,
                          ),
                        ),
                        const SizedBox(width: T20UI.spaceSize / 2),
                        Expanded(
                          child: AddEditActionTypeAttackActionSelectorCard(
                            value: DistanceAttack,
                            label: 'Á distancia',
                            onTap: _changeType,
                            valueSelected: selected,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
