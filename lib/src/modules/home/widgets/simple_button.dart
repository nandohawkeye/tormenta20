import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/palettes.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final palette = Palettes.dark();

    return SizedBox(
      width: 38,
      height: 38,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: palette.primaryCTA.withOpacity(.4),
            borderRadius: T20UI.borderRadius),
        child: Icon(icon),
      ),
    );
  }
}
