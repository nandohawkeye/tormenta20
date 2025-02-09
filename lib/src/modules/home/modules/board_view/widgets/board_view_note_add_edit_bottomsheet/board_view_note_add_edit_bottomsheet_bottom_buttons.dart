import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class BoardViewNoteAddEditBottomsheetBottomButtons extends StatelessWidget {
  const BoardViewNoteAddEditBottomsheetBottomButtons({
    super.key,
    required this.onSave,
    this.note,
    required this.isFavorited,
    required this.changeFavorited,
  });

  final Function() onSave;
  final BoardNote? note;
  final bool isFavorited;
  final Function() changeFavorited;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DividerLevelTwo(verticalPadding: 0),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              Expanded(
                child: MainButton(
                  label: 'Salvar',
                  onTap: onSave,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  T20UI.spaceWidth,
                  SizedBox(
                    height: T20UI.inputHeight,
                    width: T20UI.inputHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: T20UI.borderRadius,
                        color: palette.backgroundLevelTwo,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: T20UI.borderRadius,
                          splashColor: palette.accent.withOpacity(.4),
                          onTap: changeFavorited,
                          child: Icon(
                            isFavorited
                                ? FontAwesomeIcons.solidStar
                                : FontAwesomeIcons.star,
                            color:
                                isFavorited ? palette.selected : palette.icon,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              T20UI.spaceWidth,
              const SimpleCloseButton()
            ],
          ),
        )
      ],
    );
  }
}
