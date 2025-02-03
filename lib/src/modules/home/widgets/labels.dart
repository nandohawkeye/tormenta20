import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';

class Labels extends StatelessWidget {
  const Labels(this.label, {super.key, this.maxLines = 1, this.textColor});

  final String label;
  final Color? textColor;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 20,
        color: textColor,
        fontFamily: FontFamily.tormenta,
      ),
    );
  }
}
