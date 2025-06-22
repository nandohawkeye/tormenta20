import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/widgets/character_avatar_image.dart';
import 'package:tormenta20/src/shared/widgets/divinity_card.dart';

class CharacterRecordImage extends StatelessWidget {
  const CharacterRecordImage(this.characterBoard, {super.key});

  final ValueListenable<CharacterBoard> characterBoard;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ListenableBuilder(
        listenable: characterBoard,
        builder: (_, __) {
          final character = characterBoard.value;
          return SizedBox(
            width: 115,
            height: 115,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CharacterAvatarImage(
                  character: character,
                  imageSize: 105,
                  imagePadding: 10,
                ),
                AnimationConfiguration.synchronized(
                  child: ScaleAnimation(
                    duration: const Duration(seconds: 1),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: DivinityCard(character.divinityId),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
