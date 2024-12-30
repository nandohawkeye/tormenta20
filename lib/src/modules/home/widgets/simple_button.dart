import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/palettes.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.iconPadding = EdgeInsets.zero,
  });

  final IconData icon;
  final Function() onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final EdgeInsets iconPadding;

  @override
  Widget build(BuildContext context) {
    final palette = Palettes.dark();

    return SizedBox(
      width: 38,
      height: 38,
      child: Card(
        color: backgroundColor,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          splashColor: palette.primaryCTA.withOpacity(.4),
          onTap: onTap,
          child: Padding(
            padding: iconPadding,
            child: Icon(
              icon,
              color: iconColor ?? palette.primaryCTA.withOpacity(.8),
            ),
          ),
        ),
      ),
    );
  }
}
