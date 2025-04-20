import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character/character_store.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_boards/character_board_field_card.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/character.dart';

class CharacterBoardField extends StatelessWidget {
  const CharacterBoardField(
    this.store, {
    super.key,
    required this.character,
    required this.boards,
  });

  final CharacterStore store;
  final Character character;
  final List<Board> boards;

  @override
  Widget build(BuildContext context) {
    if (boards.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        T20UI.spaceHeight,
        SizedBox(
          height: T20UI.inputHeight,
          width: double.infinity,
          child: ListView.separated(
            shrinkWrap: true,
            padding: T20UI.horizontallScreenPadding,
            scrollDirection: Axis.horizontal,
            separatorBuilder: T20UI.separatorBuilderHorizontal,
            itemCount: boards.length,
            itemBuilder: (_, index) {
              return CharacterBoardFieldCard(
                board: boards[index],
              );
            },
          ),
        ),
        T20UI.spaceHeight,
        const Divider(),
      ],
    );
  }
}
