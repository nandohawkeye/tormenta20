import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

class BottomSheetAddEditBoardCharacterClassesSelectorCard
    extends StatelessWidget {
  const BottomSheetAddEditBoardCharacterClassesSelectorCard({
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
      if (value.contains('barbaro')) {
        return 'Bárbaro';
      } else if (value.contains('cacador')) {
        return 'Caçador';
      } else {
        final first = value.split('_').first;
        return first.capitalize();
      }
    }

    final isSelected = selecteds.any((s) => s == classeType);

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
        onTap: () => onTap(classeType),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  handleTitle(classeType.name),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  handleSubtitle(classeType.name),
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
