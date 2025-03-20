import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/character_card/character_card_image.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class GrimorieCharactersListCard extends StatelessWidget {
  const GrimorieCharactersListCard({
    super.key,
    required this.character,
    required this.grimoireCharacters,
    required this.onAdd,
    required this.onRemove,
  });

  final Character character;
  final List<Character> grimoireCharacters;
  final Function(Character) onAdd;
  final Function(Character) onRemove;

  @override
  Widget build(BuildContext context) {
    final isSelected = grimoireCharacters.any((g) => g.uuid == character.uuid);
    return Card(
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () {
          if (isSelected) {
            onRemove(character);
          } else {
            onAdd(character);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: T20UI.smallSpaceSize),
          child: Row(
            children: [
              CharacterCardImage(
                character,
                size: 32,
                differenceSize: 5,
              ),
              T20UI.smallSpaceWidth,
              Text(
                character.exibitionLabel,
                style: const TextStyle(fontSize: 16),
              ),
              T20UI.spaceWidth,
              CustomChecked(
                value: isSelected,
                isEnabledToTap: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
