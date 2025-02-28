import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';
import 'package:tormenta20/src/shared/extensions/data_ext.dart';

class BoardNoteCard extends StatelessWidget {
  const BoardNoteCard({
    super.key,
    required this.note,
    required this.onSelected,
    required this.onRemove,
  });

  final BoardNote note;
  final Function(BoardNote) onSelected;
  final Function(BoardNote) onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (note.isFavorited)
          Padding(
            padding: const EdgeInsets.only(right: T20UI.spaceSize),
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: palette.selected,
            ),
          ),
        Expanded(
          child: Card(
            child: InkWell(
              borderRadius: T20UI.borderRadius,
              onTap: () => onSelected(note),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: T20UI.smallSpaceSize,
                  horizontal: T20UI.smallSpaceSize,
                ).copyWith(left: T20UI.spaceSize),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            note.note,
                            maxLines: 200000,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            note.updatedAt.formatted,
                            style: TextStyle(
                              fontSize: 12,
                              color: palette.textDisable,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SimpleButton(
                          icon: FontAwesomeIcons.solidTrashCan,
                          backgroundColor: palette.selected,
                          iconColor: palette.onSelected,
                          onTap: () => onRemove(note),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
