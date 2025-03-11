import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class MenaceAtributeItem extends StatelessWidget {
  const MenaceAtributeItem({
    super.key,
    required this.value,
    required this.label,
  });

  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$value',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 24,
            fontFamily: FontFamily.tormenta,
            color: palette.selected,
          ),
        ),
      ],
    );
  }
}
