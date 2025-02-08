import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';

class AddEditBoardCharacterCard extends StatelessWidget {
  const AddEditBoardCharacterCard({
    super.key,
    required this.player,
    required this.onSelect,
    required this.onRemove,
  });

  final BoardPlayer player;
  final Function(BoardPlayer) onSelect;
  final Function(BoardPlayer) onRemove;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 54;
    return Padding(
      padding: T20UI.horizontalPadding,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: palette.cardBackground,
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: () => onSelect(player),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  SizedBox(
                    height: imageSize + 2,
                    width: imageSize + 2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Icon(
                            FontAwesomeIcons.solidUser,
                            color: palette.disable,
                          ),
                        ),
                        if (player.imagePath != null)
                          ClipOval(
                            child: Image.file(
                              File(player.imagePath!),
                              height: imageSize,
                              width: imageSize,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const SizedBox.shrink(),
                            ),
                          ),
                        if (player.imageAsset != null)
                          ClipOval(
                            child: Image.asset(
                              player.imageAsset!,
                              height: imageSize,
                              width: imageSize,
                              fit: BoxFit.cover,
                            ),
                          ),
                        Assets.images.bordaToken.image(
                          height: imageSize + 2,
                          width: imageSize + 2,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${player.playerName} - ${player.characterName}',
                          style: TextStyle(
                            fontFamily: FontFamily.tormenta,
                            color: palette.selected,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${CharacterUtils.handleBroodTitle(player.brood.name)} - ${CharacterUtils.handleAllClassesTypeTitle(player.classes.map((c) => c.type))}',
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
                    backgroundColor: palette.selected,
                    iconColor: palette.indicator.withOpacity(.6),
                    onTap: () => onRemove(player),
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
