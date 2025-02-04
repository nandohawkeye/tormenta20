import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';

class AddEditBoardSiteCard extends StatelessWidget {
  const AddEditBoardSiteCard({
    super.key,
    required this.link,
    required this.onSelect,
    required this.onRemove,
  });

  final BoardLink link;
  final Function(BoardLink) onSelect;
  final Function(BoardLink) onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontalPadding,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: palette.cardBackground,
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: () => onSelect(link),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.link,
                    size: 32,
                    color: palette.accent.withOpacity(.6),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          link.title,
                          style: TextStyle(
                            fontFamily: FontFamily.tormenta,
                            color: palette.accent.withOpacity(.6),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          link.link,
                          style: TextStyle(
                            color: palette.textDisable,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SimpleButton(
                    icon: FontAwesomeIcons.solidTrashCan,
                    backgroundColor: palette.accent.withOpacity(.6),
                    iconColor: palette.indicator.withOpacity(.6),
                    onTap: () => onRemove(link),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
