import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';

class MagicCard extends StatelessWidget {
  const MagicCard({super.key, required this.magic});

  final Magic magic;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: const Color(0xFF212121),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          magic.name,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
