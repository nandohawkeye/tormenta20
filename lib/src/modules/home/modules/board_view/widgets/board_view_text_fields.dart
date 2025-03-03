import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';

class BoardViewTextFields extends StatelessWidget {
  const BoardViewTextFields(this.board, {super.key});

  final Board board;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.allPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            board.adventureName,
            maxLines: 3,
            style: TextStyle(
              fontSize: 24,
              fontFamily: FontFamily.tormenta,
              fontWeight: FontWeight.w500,
              color: palette.accent,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            board.name,
            maxLines: 3,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: FontFamily.tormenta,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (board.desc != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                board.desc!,
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
