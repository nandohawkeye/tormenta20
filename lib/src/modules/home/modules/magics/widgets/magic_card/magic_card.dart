import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_bottomsheet/magic_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_card/magic_card_indicator_search.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

class MagicCard extends StatelessWidget {
  const MagicCard({super.key, required this.magic, required this.searchFilter});

  final Magic magic;
  final String searchFilter;

  @override
  Widget build(BuildContext context) {
    bool compareText(String value) => value
        .toLowerCase()
        .replaceAllDiacritics()
        .contains((searchFilter.toLowerCase().replaceAllDiacritics()));
    final bool hasInTarget =
        searchFilter.isEmpty ? false : compareText(magic.targetAreaEfect);
    final bool hasInDesc =
        searchFilter.isEmpty ? false : compareText(magic.desc);
    final bool hasInPublication =
        searchFilter.isEmpty ? false : compareText(magic.publication);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: palette.backgroundLevelOne,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          splashColor: palette.accent.withOpacity(.4),
          onTap: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              isDismissible: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: MagicBottomsheet(
                  magic: magic,
                  enableGrimories: true,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  magic.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Wrap(
                  runSpacing: 6,
                  spacing: 16,
                  children: [
                    if (hasInTarget)
                      const MagicCardIndicatorSearch(
                        icon: FontAwesomeIcons.locationCrosshairs,
                        label: 'no alvo/área/efeito',
                      ),
                    if (hasInDesc)
                      const MagicCardIndicatorSearch(
                        icon: FontAwesomeIcons.scroll,
                        label: 'na descrição',
                      ),
                    if (hasInPublication)
                      const MagicCardIndicatorSearch(
                        icon: FontAwesomeIcons.bookOpen,
                        label: 'na publicação',
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
