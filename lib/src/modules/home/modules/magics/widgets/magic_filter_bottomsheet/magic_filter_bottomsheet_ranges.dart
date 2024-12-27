import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_item.dart';

class MagicFilterBottomsheetRanges extends StatelessWidget {
  const MagicFilterBottomsheetRanges({
    super.key,
    required this.itens,
    required this.itensSelected,
    required this.onTap,
  });

  final List<Enum> itens;
  final List<Enum> itensSelected;
  final Function(dynamic) onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: palette.onBottomsheet.withOpacity(.2),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: T20UI.spaceSize - 4,
          right: T20UI.spaceSize,
          bottom: T20UI.spaceSize / 2,
          top: T20UI.spaceSize / 2,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.peopleArrows,
                  color: palette.primaryCTA,
                  size: 12,
                ),
                const SizedBox(width: 6),
                Text(
                  'Alcances:',
                  style: TextStyle(
                    color: palette.primaryCTA,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Wrap(
                runSpacing: T20UI.spaceSize,
                spacing: T20UI.spaceSize,
                children: itens
                    .map(
                      (i) => MagicFilterBottomsheetItem(
                        label: i.name == 'Medio' ? 'Médio' : i.name,
                        checked: itensSelected.contains(i),
                        type: i,
                        onTap: onTap,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
