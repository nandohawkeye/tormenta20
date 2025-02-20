import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/menace_type.dart';
import 'package:tormenta20/src/shared/utils/menace_utils.dart';

class AddEditMenaceScreenTypeSelectorCard extends StatelessWidget {
  const AddEditMenaceScreenTypeSelectorCard({
    super.key,
    required this.menace,
    this.selected,
    required this.onTap,
  });

  final MenaceType menace;
  final MenaceType? selected;
  final Function(MenaceType) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = menace == selected;

    return AnimatedContainer(
      height: T20UI.inputHeight * MediaQuery.of(context).textScaler.scale(1),
      duration: T20UI.defaultDurationAnimation,
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: isSelected ? palette.selected : palette.backgroundLevelTwo,
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(menace),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MenaceUtils.handleMenaceTitle(menace.name),
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
