import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                      horizontal: T20UI.spaceSize - 4,
                      vertical: T20UI.spaceSize / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.leaf,
                            size: 16,
                            color: Colors.greenAccent,
                          ),
                          SizedBox(width: 6),
                          Text(
                            grimoire.name,
                            style: const TextStyle(
                              fontFamily: 'tormenta',
                              color: Colors.greenAccent,
                              fontSize: 18,
                            ),
                          ),
                        ],
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
                      Row(
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: palette.textDisable.withOpacity(.5),
                              ),
                              child: Icon(
                                FontAwesomeIcons.userSlash,
                                size: 16,
                              ),
                            ),
                          )
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
