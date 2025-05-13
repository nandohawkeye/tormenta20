import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class ImportFileBottomsheetBoardCard extends StatelessWidget {
  const ImportFileBottomsheetBoardCard({
    super.key,
    required this.board,
    this.selected,
    required this.onTap,
  });

  final Board board;
  final Board? selected;
  final Function(Board board) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = selected?.uuid == board.uuid;
    return Card(
      child: InkWell(
        onTap: () => onTap(board),
        child: Padding(
          padding: T20UI.horizontalPadding,
          child: Center(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(board.adventureName),
                  Text(
                    board.name,
                    style: TextStyle(
                      fontSize: 12,
                      color: palette.textSecundary,
                    ),
                  ),
                ],
              ),
              T20UI.spaceWidth,
              CustomChecked(value: isSelected)
            ],
          )),
        ),
      ),
    );
  }
}
