import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/shared/widgets/screen_slide_images_button.dart';

class ManaceScreenButton extends StatelessWidget {
  const ManaceScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> menaces =
        Assets.images.menaces.values.map((m) => m.path).toList();
    return ScreenSlideImagesButton(
      imageAssets: menaces,
      title: 'Criar ameaça',
      subtitle:
          'Crie ou se vincule a mesa de um mestre, e comece a se divertir com seus amigos!',
      onTap: () {},
    );
  }
}
