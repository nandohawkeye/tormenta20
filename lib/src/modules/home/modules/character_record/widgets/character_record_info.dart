import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/utils/character_alignment_type_utils.dart';
import 'package:tormenta20/src/shared/utils/character_board_utils.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';

class CharacterRecordInfo extends StatelessWidget {
  const CharacterRecordInfo(this.characterBoard, {super.key});

  final ValueListenable<CharacterBoard> characterBoard;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ListenableBuilder(
        listenable: characterBoard,
        builder: (_, __) {
          final character = characterBoard.value;
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    character.name,
                    maxLines: 2,
                    style: const TextStyle(
                      fontFamily: FontFamily.tormenta,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Flexible(
                  child: Row(
                    children: [
                      Text(
                        CharacterUtils.handleBroodTitle(character.brood.name),
                        style: TextStyle(
                          color: palette.textSecundary,
                          fontSize: 14,
                        ),
                      ),
                      T20UI.smallSpaceWidth,
                      Icon(
                        CharacterAlignmentTypeUtils.handleIcon(
                          character.alignmentType.name,
                        ),
                        size: 12,
                        color: palette.textSecundary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        CharacterAlignmentTypeUtils.handleTitle(
                          character.alignmentType.name,
                        ),
                        maxLines: 2,
                        style: TextStyle(
                          color: palette.textSecundary,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        CharacterBoardUtils.handleAllClassesTypeTitle(
                          character.classes,
                        ),
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          color: palette.textSecundary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Card(
                  color: palette.selected.withValues(alpha: .8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 6,
                    ),
                    child: Text(
                      'Nivel ${character.classes.length.toString().padLeft(2, '0')}',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
