import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

class BottomSheetAddEditBoardCharacterBroodSelectorCard
    extends StatelessWidget {
  const BottomSheetAddEditBoardCharacterBroodSelectorCard({
    super.key,
    required this.brood,
    this.selected,
    required this.onTap,
  });

  final Brood brood;
  final Brood? selected;
  final Function(Brood) onTap;

  @override
  Widget build(BuildContext context) {
    String handleSubtitle(String value) {
      if (value.contains('jade')) {
        return 'Império de jade';
      } else if (value.contains('ghanor')) {
        return 'A lenda de Ghanor';
      } else {
        return 'Base T20';
      }
    }

    String handleTitle(String value) {
      if (value.contains('meioelfo')) {
        return 'Meio-elfo';
      } else if (value.contains('sereiatritao')) {
        return 'Sereia - Tritão';
      } else if (value.contains('silfide')) {
        return 'Sílfide';
      } else if (value.contains('suraggels')) {
        final last = value.split('_').last;
        return 'Suraggels ($last)';
      } else if (value.contains('anao')) {
        return 'Anão';
      } else {
        final first = value.split('_').first;
        return first.capitalize();
      }
    }

    final isSelected = brood == selected;

    return AnimatedContainer(
      height: T20UI.inputHeight * MediaQuery.of(context).textScaler.scale(1),
      duration: T20UI.defaultDurationAnimation,
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: isSelected
            ? palette.accent.withOpacity(.6)
            : palette.onBottomsheetSecondLevel,
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(brood),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  handleTitle(brood.name),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  handleSubtitle(brood.name),
                  style: TextStyle(
                    fontSize: 12,
                    color: palette.textPrimary.withOpacity(.8),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
