import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';

class BottomSheetAddEditBoardPlayerBroodSelectorCard extends StatelessWidget {
  const BottomSheetAddEditBoardPlayerBroodSelectorCard({
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
    final isSelected = brood == selected;

    return AnimatedContainer(
      height: T20UI.inputHeight * MediaQuery.of(context).textScaler.scale(1),
      duration: T20UI.defaultDurationAnimation,
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: isSelected ? palette.selected : palette.backgroundLevelThree,
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
                  CharacterUtils.handleBroodTitle(brood.name),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  CharacterUtils.handleBroodSubtitle(brood.name),
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
