import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class CharacterBoardFieldCard extends StatelessWidget {
  const CharacterBoardFieldCard({
    super.key,
    required this.board,
  });

  final Board board;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: palette.backgroundLevelOne,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    board.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    board.adventureName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: palette.textSecundary,
                    ),
                  ),
                ],
              ),
              T20UI.spaceWidth,
              const CustomChecked(
                value: true,
                isEnabledToTap: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
