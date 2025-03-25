import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AboutSimpleLinkButton extends StatelessWidget {
  const AboutSimpleLinkButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final Widget icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: T20UI.inputHeight,
        width: T20UI.inputHeight,
        child: Card(
          color: palette.selected,
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: onTap,
            child: icon,
          ),
        ),
      ),
    );
  }
}
