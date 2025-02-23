import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/treasure_type.dart';
import 'package:tormenta20/src/shared/utils/treasure_type_utils.dart';

class AddEditMenaceScreenTypeTreasureSelectorCard extends StatelessWidget {
  const AddEditMenaceScreenTypeTreasureSelectorCard({
    super.key,
    required this.type,
    this.selected,
    required this.onTap,
  });

  final TreasureType type;
  final TreasureType? selected;
  final Function(TreasureType) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = type == selected;

    return AnimatedContainer(
      height: T20UI.inputHeight * MediaQuery.of(context).textScaler.scale(1),
      duration: T20UI.defaultDurationAnimation,
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: isSelected ? palette.selected : palette.backgroundLevelTwo,
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(type),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TreasureTypeUtils.handleMenaceTitle(type.name),
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
