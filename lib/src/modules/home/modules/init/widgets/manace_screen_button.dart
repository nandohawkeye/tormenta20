import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_screen.dart';
import 'package:tormenta20/src/shared/widgets/screen_slide_images_button.dart';

class ManaceScreenButton extends StatelessWidget {
  const ManaceScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> menaces =
        Assets.images.menaces.values.map((m) => m.path).toList();
    return ScreenSlideImagesButton(
      imageAssets: menaces,
      title: 'Ameaças',
      subtitle:
          'Crie suas ameaças, e se for mestre vincule-as as suas aventuras.',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AddEditMenaceScreen(),
          ),
        );
      },
    );
  }
}
