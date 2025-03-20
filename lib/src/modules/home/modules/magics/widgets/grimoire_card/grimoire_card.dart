// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/grimoire_card/grimoire_card_caracter_images.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';

class GrimoireCard extends StatelessWidget {
  const GrimoireCard({super.key, required this.grimoire, required this.height});

  final Grimoire grimoire;
  final double height;

  @override
  Widget build(BuildContext context) {
    const double width = 235;
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GrimorieScreen(grimoire: grimoire),
                    ),
                  );
                },
                borderRadius: T20UI.borderRadius,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                          horizontal: T20UI.smallSpaceSize)
                      .copyWith(top: T20UI.smallSpaceSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: grimoire.uuid,
                        child: Material(
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                  grimoire.iconAsset,
                                  color: palette.accent,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                grimoire.name,
                                style: TextStyle(
                                  fontFamily: FontFamily.tormenta,
                                  color: palette.accent,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      T20UI.smallSpaceHeight,
                      Text(
                        grimoire.magicsCharacters.isEmpty
                            ? 'Nenhuma mágica'
                            : '${(grimoire.magicsCharacters.length).toString().padLeft(2, '0')} mágica${grimoire.magicsCharacters.length > 1 ? 's' : ''}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                      T20UI.smallSpaceHeight,
                      GrimoireCardCaracterImages(
                        characters: grimoire.characters,
                        width: 300,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
