import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class CharacterBoardFieldCard extends StatelessWidget {
  const CharacterBoardFieldCard({
    super.key,
    required this.board,
    required this.character,
    required this.onAdd,
    required this.onRemove,
  });

  final Board board;
  final Character character;
  final Function(Board) onAdd;
  final Function(Board) onRemove;

  @override
  Widget build(BuildContext context) {
    final isSelected =
        board.characters.any((c) => c.parentuuid == character.uuid);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: palette.backgroundLevelOne,
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () {
          if (isSelected) {
            onRemove(board);
          } else {
            onAdd(board);
          }
        },
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
                CustomChecked(
                  value: isSelected,
                  isEnabledToTap: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
