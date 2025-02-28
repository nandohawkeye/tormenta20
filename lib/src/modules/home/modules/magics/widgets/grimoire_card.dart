// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_screen.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';

class GrimoireCard extends StatelessWidget {
  const GrimoireCard({super.key, required this.grimoire});

  final Grimoire grimoire;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 100 * MediaQuery.of(context).textScaler.scale(1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 250,
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
                      horizontal: T20UI.screenContentSpaceSize,
                      vertical: T20UI.smallSpaceSize),
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
                                  color: palette.selected,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                grimoire.name,
                                style: TextStyle(
                                  fontFamily: FontFamily.tormenta,
                                  color: palette.selected,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        grimoire.magicsCharacters.isEmpty
                            ? 'Nenhuma mágica'
                            : '${(grimoire.magicsCharacters.length).toString().padLeft(2, '0')} mágica${grimoire.magicsCharacters.length > 1 ? 's' : ''}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 6),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 125),
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: .5,
                                    color: palette.textSecundary,
                                  ),
                                  color: Colors.grey[800],
                                ),
                                child: const Center(
                                    child: Text(
                                  '+2',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[800],
                                  border: Border.all(
                                    width: .5,
                                    color: palette.textSecundary,
                                  ),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.userSlash,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 75),
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[800],
                                  border: Border.all(
                                    width: .5,
                                    color: palette.textSecundary,
                                  ),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.userSlash,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[800],
                                  border: Border.all(
                                    width: .5,
                                    color: palette.textSecundary,
                                  ),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.userSlash,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[800],
                                  border: Border.all(
                                    width: .5,
                                    color: palette.textSecundary,
                                  ),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.userSlash,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                            width: 32,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[800],
                                border: Border.all(
                                  width: .5,
                                  color: palette.textSecundary,
                                ),
                              ),
                              child: const Icon(
                                FontAwesomeIcons.userSlash,
                                size: 14,
                              ),
                            ),
                          ),
                        ],
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
