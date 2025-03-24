import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class RemoveMenaceInBoardBottomsheet extends StatelessWidget {
  const RemoveMenaceInBoardBottomsheet(this.board, {super.key});

  final Board board;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: Text(
                  'Remover da ${board.name}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: FontFamily.tormenta,
                  ),
                ),
              ),
              T20UI.spaceHeight,
            ],
          ),
          const DividerLevelTwo(verticalPadding: 0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: T20UI.horizontalPadding,
                  child: Text(
                    'Deseja realmente remover essa ameça desta mesa? Ao fazer isso as sessões e combates desta mesa também serão impactados.',
                    maxLines: 20,
                    style: TextStyle(
                      fontSize: 18,
                      color: palette.primary,
                    ),
                  ),
                ),
              ),
              T20UI.spaceHeight,
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DividerLevelTwo(verticalPadding: 0),
              Padding(
                padding: T20UI.allPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        label: 'Sim, remover',
                        onTap: () => Navigator.pop(context, true),
                      ),
                    ),
                    const SimpleCloseButton()
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
