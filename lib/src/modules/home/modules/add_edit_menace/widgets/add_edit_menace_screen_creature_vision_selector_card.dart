import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/creature_vision.dart';
import 'package:tormenta20/src/shared/utils/creature_vision_utils.dart';

class AddEditMenaceScreenCreatureVisionSelectorCard extends StatelessWidget {
  const AddEditMenaceScreenCreatureVisionSelectorCard({
    super.key,
    required this.vision,
    this.selected,
    required this.onTap,
  });

  final CreatureVision vision;
  final CreatureVision? selected;
  final Function(CreatureVision) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = vision == selected;

    return AnimatedContainer(
      height: T20UI.inputHeight * MediaQuery.of(context).textScaler.scale(1),
      duration: T20UI.defaultDurationAnimation,
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: isSelected ? palette.selected : palette.backgroundLevelTwo,
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(vision),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CreatureVisionUtils.handleTitle(vision.name),
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
