import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddGrimorieBottomsheetColorFieldItem extends StatelessWidget {
  const AddGrimorieBottomsheetColorFieldItem({
    super.key,
    required this.colorInt,
    required this.colorSelected,
    required this.onSelectColor,
  });

  final int colorInt;
  final int colorSelected;
  final Function(int) onSelectColor;

  @override
  Widget build(BuildContext context) {
    final isSelected = colorInt == colorSelected;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Color(colorInt).withValues(alpha: .4),
      onTap: () => onSelectColor(colorInt),
      child: Opacity(
        opacity: isSelected ? 1 : .2,
        child: SizedBox(
          height: 44,
          width: 44,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? Color(colorInt)
                    : palette.textPrimary.withValues(alpha: .5),
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: ColoredBox(color: Color(colorInt))),
            ),
          ),
        ),
      ),
    );
  }
}
