import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class ErrorImagePlaceholder extends StatelessWidget {
  const ErrorImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(color: palette.backgroundLevelOne),
        child: const Center(
          child: Icon(
            FontAwesomeIcons.fileCircleXmark,
          ),
        ),
      ),
    );
  }
}
