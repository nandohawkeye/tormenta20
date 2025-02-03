import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';

class AddGrimorieBottomsheetHeader extends StatelessWidget {
  const AddGrimorieBottomsheetHeader(this.initialGrimoire, {super.key});

  final Grimoire? initialGrimoire;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        Padding(
          padding: T20UI.horizontalPadding,
          child: Text(
            '${initialGrimoire != null ? 'Editando' : 'Criando'} grimório',
            style: const TextStyle(
              fontSize: 18,
              fontFamily: FontFamily.tormenta,
            ),
          ),
        ),
        T20UI.spaceHeight,
      ],
    );
  }
}
