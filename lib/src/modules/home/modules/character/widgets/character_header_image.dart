import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/character_card/character_card_image.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/widgets/divinity_card.dart';

class CharacterHeaderImage extends StatelessWidget {
  const CharacterHeaderImage(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105 + 10,
      width: 105 + 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CharacterCardImage(
            character,
            size: 105,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: DivinityCard(character.divinityId),
          )
        ],
      ),
    );
  }
}
