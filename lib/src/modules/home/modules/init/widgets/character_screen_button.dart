import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/shared/widgets/screen_slide_images_button.dart';

class CharacterScreenButton extends StatelessWidget {
  const CharacterScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> characters =
        Assets.images.caracters.values.map((a) => a.path).toList();
    return ScreenSlideImagesButton(
      imageAssets: characters,
      title: 'Criar personagem',
      subtitle: 'Crie um personagem, vincule-o a uma mesa e comece a jogar!',
      onTap: () {},
    );
  }
}
