import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';

class MagicCirclesSelectorItem extends StatelessWidget {
  const MagicCirclesSelectorItem({
    super.key,
    required this.circle,
    required this.selecteds,
    required this.onTap,
  });

  final MagicCircle circle;
  final List<MagicCircle> selecteds;
  final Function(MagicCircle) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = selecteds.any((s) => s.level == circle.level);
    return Expanded(
      child: AnimatedContainer(
        height: T20UI.inputHeight,
        duration: T20UI.defaultDurationAnimation,
        decoration: BoxDecoration(
          borderRadius: T20UI.borderRadius,
          color: isSelected ? palette.selected : palette.backgroundLevelOne,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: () => onTap(circle),
            child: Padding(
              padding: T20UI.horizontalPadding,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  '${circle.level}˚',
                  style: TextStyle(
                    fontSize: 16,
                    color: palette.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
