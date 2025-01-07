import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_bottomsheet/magic_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_card/magic_card_indicator_search.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';

class MagicCard extends StatelessWidget {
  const MagicCard({super.key, required this.magic, required this.searchFilter});

  final Magic magic;
  final String searchFilter;

  @override
  Widget build(BuildContext context) {
    final bool hasInTarget = searchFilter.isEmpty
        ? false
        : magic.targetAreaEfect.contains(searchFilter);
    final bool hasInDesc =
        searchFilter.isEmpty ? false : magic.desc.contains(searchFilter);
    final bool hasInPublication =
        searchFilter.isEmpty ? false : magic.publication.contains(searchFilter);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: const Color(0xFF212121),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          splashColor: palette.primaryCTA.withOpacity(.4),
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
