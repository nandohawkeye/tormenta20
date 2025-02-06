import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class BottomSheetAddEditBoardPlayerHeader extends StatelessWidget {
  const BottomSheetAddEditBoardPlayerHeader({super.key});

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
            'Jogador',
            style: TextStyle(
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
