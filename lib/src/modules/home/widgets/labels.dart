import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';

class Labels extends StatelessWidget {
  const Labels(
    this.label, {
    super.key,
    this.maxLines = 1,
    this.textColor,
    this.fontSize = 20,
  });

  final String label;
  final Color? textColor;
  final int maxLines;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontFamily: FontFamily.tormenta,
      ),
    );
  }
}
