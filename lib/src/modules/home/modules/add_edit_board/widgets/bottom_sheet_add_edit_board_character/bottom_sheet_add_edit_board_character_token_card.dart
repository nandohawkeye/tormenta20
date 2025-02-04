import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_token_card_bord.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_token_card_tag.dart';

class BottomSheetAddEditBoardCharacterTokenCard extends StatelessWidget {
  const BottomSheetAddEditBoardCharacterTokenCard({
    super.key,
    required this.assetPath,
    this.selected,
    required this.onTap,
  });

  final String assetPath;
  final String? selected;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = assetPath == selected;
    return InkWell(
      onTap: () => onTap(assetPath),
      child: SizedBox(
        height: 95,
        width: 90,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.5),
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipOval(
                  child: Image.asset(
                    assetPath,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (isSelected)
              const BottomSheetAddEditBoardCharacterTokenCardBord(),
            BottomSheetAddEditBoardCharacterTokenCardTag(
              tag: assetPath
                  .split('/')
                  .last
                  .replaceAll('_', ' ')
                  .replaceAll('.png', ''),
            )
          ],
        ),
      ),
    );
  }
}
