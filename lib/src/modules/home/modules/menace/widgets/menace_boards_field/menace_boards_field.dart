import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/menace/menace_store.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_boards_field/menace_boards_field_card.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';

class MenaceBoardsField extends StatelessWidget {
  const MenaceBoardsField(this.store,
      {super.key, required this.menace, required this.boards});

  final MenaceStore store;
  final Menace menace;
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
              return MenaceBoardsFieldCard(
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
