import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magic_selected/magic_selected.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_card/magic_card_indicator_search.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class AddMagicsCard extends StatelessWidget {
  const AddMagicsCard({
    super.key,
    required this.magic,
    required this.selectedMagics,
    required this.onTap,
    required this.searchFilter,
    required this.disabledMagics,
  });

  final Magic magic;
  final List<Magic> selectedMagics;
  final String searchFilter;
  final List<Magic> disabledMagics;
  final Function(Magic) onTap;

  @override
  Widget build(BuildContext context) {
    bool compareText(String value) => value
        .toLowerCase()
        .replaceAllDiacritics()
        .contains((searchFilter.toLowerCase().replaceAllDiacritics()));
    final isDisable = disabledMagics.any((m) => m.id == magic.id);
    final bool hasInTarget =
        searchFilter.isEmpty ? false : compareText(magic.targetAreaEfect);
    final bool hasInDesc =
        searchFilter.isEmpty ? false : compareText(magic.desc);
    final bool hasInPublication =
        searchFilter.isEmpty ? false : compareText(magic.publication);
    return Opacity(
      opacity: isDisable ? .2 : 1,
      child: Card(
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: isDisable ? null : () => onTap(magic),
          enableFeedback: false,
          onLongPress: isDisable
              ? null
              : () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MagicSelected(
                        magic: magic,
                        enableGrimories: false,
                      ),
                    ),
                  );
                },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        magic.name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Wrap(
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
                        ),
                      )
                    ],
                  ),
                ),
                CustomChecked(
                  value: selectedMagics.contains(magic),
                  isEnabledToTap: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
