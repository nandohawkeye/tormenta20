import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class SelectorSecundarySimpleButton extends StatelessWidget {
  const SelectorSecundarySimpleButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: palette.backgroundLevelTwo,
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: onTap,
        child: SizedBox(
          height: T20UI.inputHeight,
          width: T20UI.inputHeight,
          child: Icon(
            icon,
            color: palette.accent,
          ),
        ),
      ),
    );
  }
}
