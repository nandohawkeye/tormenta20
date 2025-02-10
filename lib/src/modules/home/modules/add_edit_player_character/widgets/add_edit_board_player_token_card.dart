import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_token_card_bord.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_token_card_tag.dart';

class AddEditBoardPlayerTokenCard extends StatelessWidget {
  const AddEditBoardPlayerTokenCard({
    super.key,
    required this.assetPath,
    this.selected,
    required this.onTap,
    required this.size,
  });

  final String assetPath;
  final String? selected;
  final Function(String) onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final isSelected = assetPath == selected;
    return InkWell(
      onTap: () => onTap(assetPath),
      child: SizedBox(
        height: size + 10,
        width: size + 10,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.5),
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipOval(
                  child: Image.asset(
                    assetPath,
                    height: size,
                    width: size,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (isSelected) AddEditBoardPlayerTokenCardBord(size: size),
            AddEditBoardPlayerTokenCardTag(
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
