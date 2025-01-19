import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class MagicCardIndicatorSearch extends StatelessWidget {
  const MagicCardIndicatorSearch({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: palette.accent,
          size: 14,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: palette.accent,
          ),
        )
      ],
    );
  }
}
