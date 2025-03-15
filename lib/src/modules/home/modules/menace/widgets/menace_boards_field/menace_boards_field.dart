import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/menace/menace_store.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_boards_field/menace_boards_field_card.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/remove_menace_in_board_bottomsheet/remove_menace_in_board_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';

class MenaceBoardsField extends StatelessWidget {
  const MenaceBoardsField(this.store, {super.key});

  final MenaceStore store;

  @override
  Widget build(BuildContext context) {
    void removeBoard(Board board) async {
      await BottomsheetUtils.show<bool?>(
        context: context,
        child: RemoveMenaceInBoardBottomsheet(board),
      ).then((result) async {
        if (result != null) {
          store.removeLinkToBoard(board);
        }
      });
    }

    return AnimatedBuilder(
      animation: store,
      builder: (_, __) {
        final boards = store.boards;
        final menace = store.menace;

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
                    onAdd: store.addLinkToBoard,
                    onRemove: removeBoard,
                    menace: menace,
                    board: boards[index],
                  );
                },
              ),
            ),
            T20UI.spaceHeight,
            const Divider(),
          ],
        );
      },
    );
  }
}
