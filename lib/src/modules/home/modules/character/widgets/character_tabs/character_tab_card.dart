import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class CharacterTabCard extends StatelessWidget {
  const CharacterTabCard({
    super.key,
    required this.label,
    required this.tabIndex,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int tabIndex;
  final int selected;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = tabIndex == selected;
    return Card(
      color: isSelected ? palette.selected : palette.cardBackground,
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(tabIndex),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: T20UI.spaceSize),
          child: Center(
              child: Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          )),
        ),
      ),
    );
  }
}
