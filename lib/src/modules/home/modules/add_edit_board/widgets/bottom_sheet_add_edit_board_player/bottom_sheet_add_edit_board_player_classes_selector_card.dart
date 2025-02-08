import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';

class BottomSheetAddEditBoardPlayerClassesSelectorCard extends StatelessWidget {
  const BottomSheetAddEditBoardPlayerClassesSelectorCard({
    super.key,
    required this.classeType,
    required this.selecteds,
    required this.onTap,
  });

  final ClasseType classeType;
  final List<ClasseType> selecteds;
  final Function(ClasseType) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = selecteds.any((s) => s == classeType);

    return AnimatedContainer(
      height: T20UI.inputHeight * MediaQuery.of(context).textScaler.scale(1),
      duration: T20UI.defaultDurationAnimation,
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: isSelected ? palette.selected : palette.backgroundLevelThree,
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(classeType),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CharacterUtils.handleClasseTypeTitle(classeType.name),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  CharacterUtils.handleClasseTypeSubtitle(classeType.name),
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
