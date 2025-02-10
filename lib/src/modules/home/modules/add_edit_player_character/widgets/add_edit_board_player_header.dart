import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';

class AddEditBoardPlayerHeader extends StatelessWidget {
  const AddEditBoardPlayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        Padding(
            padding: T20UI.horizontalPadding,
            child: Labels('Jogador / Personagem')),
        T20UI.spaceHeight,
      ],
    );
  }
}
