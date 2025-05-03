import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_atribute_dices_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_dice_selector/add_edit_character_classe_selector_prototype.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_dice_selector/add_edit_character_dice_card.dart';

class AddEditCharacterDiceSelector extends StatelessWidget {
  const AddEditCharacterDiceSelector(this.store, {super.key});

  final AddEditCharacterAtributeDicesStore store;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (_, __) {
        final dices = store.dices;
        final selected = store.selected;

        if (dices.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            T20UI.spaceHeight,
            SizedBox(
              height: T20UI.inputHeight,
              child: ListView.builder(
                shrinkWrap: true,
                padding: T20UI.horizontallScreenPadding,
                scrollDirection: Axis.horizontal,
                itemCount: dices.length,
                prototypeItem: const AddEditCharacterDiceCardPrototype(),
                itemBuilder: (_, index) {
                  return AddEditCharacterDiceCard(
                    atributeRollDice: dices[index],
                    selected: selected,
                    onTap: store.setSelected,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
