import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter_item.dart';

class MagicFilterTypes extends StatelessWidget {
  const MagicFilterTypes({
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
        color: palette.backgroundLevelOne,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: T20UI.screenContentSpaceSize,
          right: T20UI.spaceSize,
          bottom: T20UI.smallSpaceSize,
          top: T20UI.smallSpaceSize,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.hatWizard,
                  color: palette.accent,
                  size: 12,
                ),
                const SizedBox(width: 6),
                Text(
                  'Tipos:',
                  style: TextStyle(
                    color: palette.accent,
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
                      (i) => MagicFilterItem(
                        label: i.name,
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
