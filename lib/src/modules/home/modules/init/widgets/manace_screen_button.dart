// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_screen.dart';
import 'package:tormenta20/src/modules/home/modules/menace/menace_screen.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/widgets/screen_slide_images_button.dart';

class ManaceScreenButton extends StatelessWidget {
  const ManaceScreenButton({super.key, this.subtitle, this.onTap});

  final String? subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final List<String> menaces =
        Assets.images.menaces.values.map((m) => m.path).toList();
    return ScreenSlideImagesButton(
      imageAssets: menaces,
      title: 'Ameaças',
      subtitle: subtitle ??
          'Crie suas ameaças, e se for mestre vincule-as as suas aventuras.',
      onTap: onTap ??
          () {
            Navigator.push<Menace?>(
              context,
              MaterialPageRoute(
                builder: (_) => const AddEditMenaceScreen(),
              ),
            ).then(
              (result) {
                if (result != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MenaceScreen(
                        menace: result,
                      ),
                    ),
                  );
                }
              },
            );
          },
    );
  }
}
