import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class MagicFilterBottomsheetHeader extends StatelessWidget {
  const MagicFilterBottomsheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        Padding(
          padding: T20UI.horizontalPadding,
          child: Text(
            'Filtros ativos',
            style: TextStyle(fontSize: 18, fontFamily: 'tormenta'),
          ),
        ),
        T20UI.spaceHeight,
      ],
    );
  }
}
