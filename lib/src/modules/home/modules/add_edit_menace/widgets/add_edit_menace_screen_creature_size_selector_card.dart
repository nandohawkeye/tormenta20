import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/creature_size.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';

class AddEditMenaceScreenCreatureSizeSelectorCard extends StatelessWidget {
  const AddEditMenaceScreenCreatureSizeSelectorCard({
    super.key,
    required this.creatureSize,
    this.selected,
    required this.onTap,
  });

  final CreatureSize creatureSize;
  final CreatureSize? selected;
  final Function(CreatureSize) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = creatureSize == selected;

    return AnimatedContainer(
      height: T20UI.inputHeight * MediaQuery.of(context).textScaler.scale(1),
      duration: T20UI.defaultDurationAnimation,
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: isSelected ? palette.selected : palette.backgroundLevelTwo,
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(creatureSize),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CreatureSizeUtils.handleTitle(creatureSize.category.name),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
