import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class AboutScreenSimpleButton extends StatelessWidget {
  const AboutScreenSimpleButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: T20UI.inputHeight,
        child: Card(
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(icon), T20UI.smallSpaceWidth, Text(label)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
