import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class SimpleCloseButton extends StatelessWidget {
  const SimpleCloseButton({super.key, this.backgroundColor, this.onTap});

  final Color? backgroundColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: T20UI.inputHeight,
      width: T20UI.inputHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: T20UI.borderRadius,
          color: backgroundColor ?? palette.backgroundLevelOne,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            splashColor: palette.accent.withOpacity(.4),
            onTap: onTap ?? () => Navigator.pop(context),
            child: Icon(
              FontAwesomeIcons.chevronLeft,
              color: palette.icon,
            ),
          ),
        ),
      ),
    );
  }
}
