import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AtributeItem extends StatelessWidget {
  const AtributeItem({
    super.key,
    required this.value,
    required this.label,
    this.fontSize = 24,
  });

  final int value;
  final String label;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$value',
          style: TextStyle(fontSize: fontSize),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: FontFamily.tormenta,
            color: palette.selected,
          ),
        ),
      ],
    );
  }
}
