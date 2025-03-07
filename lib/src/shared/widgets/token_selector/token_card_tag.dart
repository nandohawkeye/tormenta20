import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class TokenCardTag extends StatelessWidget {
  const TokenCardTag({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.backgroundLevelThree,
          borderRadius: T20UI.borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: Text(
            tag,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
