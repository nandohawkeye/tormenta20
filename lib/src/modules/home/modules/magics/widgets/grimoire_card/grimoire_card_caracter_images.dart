import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/grimoire_card/grimoire_card_caracter_image.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/grimoire_card/grimoire_card_caracter_rest_count_images.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class GrimoireCardCaracterImages extends StatelessWidget {
  const GrimoireCardCaracterImages({
    super.key,
    required this.characters,
    required this.width,
  });

  final List<Character> characters;
  final double width;

  @override
  Widget build(BuildContext context) {
    final minusSize = (38 * context.realTextScale);
    final defaultSize = (40 * context.realTextScale);

    if (characters.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 8, right: 4),
        child: Text(
          'Ninguém ta usando ainda, vincule-o a um personagem.',
          maxLines: 2,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      );
    }

    final sublist =
        characters.length > 5 ? characters.sublist(0, 5) : characters;

    return Padding(
      padding: const EdgeInsets.only(bottom: T20UI.smallSpaceSize),
      child: SizedBox(
        height: (40),
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(
            characters.length > sublist.length
                ? (sublist.length + 1)
                : sublist.length,
            (index) {
              if (index == sublist.length) {
                return GrimoireCardCaracterRestCountImages(
                  index: index,
                  allLength: characters.length,
                  sublistLength: sublist.length,
                  minusSize: minusSize,
                  defaultSize: defaultSize,
                );
              }

              return GrimoireCardCaracterImage(
                index: index,
                character: sublist[index],
                minusSize: minusSize,
                defaultSize: defaultSize,
              );
            },
          ),
        ),
      ),
    );
  }
}
