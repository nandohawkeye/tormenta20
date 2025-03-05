import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/stores/add_edit_action_class_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/widgets/add_edit_action_type_attack_action_selector_card.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';

class AddEditAttackActionTypeActionSelector extends StatelessWidget {
  const AddEditAttackActionTypeActionSelector(
      {super.key, required this.store, required this.onChange});

  final AddEditActionClassTypeStore store;
  final Function(Type) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: T20UI.screenContentSpaceSize,
      ),
      child: Card(
        color: palette.backgroundLevelOne,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: T20UI.screenContentSpaceSize,
                top: T20UI.smallSpaceSize,
                bottom: T20UI.smallSpaceSize,
              ),
              child: Text('Ataque'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: T20UI.smallSpaceSize,
                right: T20UI.smallSpaceSize,
                bottom: T20UI.smallSpaceSize,
              ),
              child: SizedBox(
                height: T20UI.inputHeight,
                child: AnimatedBuilder(
                  animation: store,
                  builder: (_, __) {
                    final selected = store.data;
                    return Row(
                      children: [
                        SimpleButton(
                          icon: FontAwesomeIcons.xmark,
                          backgroundColor: palette.backgroundLevelTwo,
                          iconColor: palette.accent,
                          onTap: () => onChange(ActionEnt),
                        ),
                        const SizedBox(width: T20UI.smallSpaceSize),
                        Expanded(
                          child: AddEditActionTypeAttackActionSelectorCard(
                            value: HandToHand,
                            label: 'Corpo-a-corpo',
                            onTap: onChange,
                            valueSelected: selected,
                          ),
                        ),
                        const SizedBox(width: T20UI.smallSpaceSize),
                        Expanded(
                          child: AddEditActionTypeAttackActionSelectorCard(
                            value: DistanceAttack,
                            label: 'Á distancia',
                            onTap: onChange,
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
