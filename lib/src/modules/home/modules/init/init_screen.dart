import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: T20UI.allPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Labels('Personagens'),
                SimpleButton(
                  icon: FontAwesomeIcons.plus,
                  onTap: () {},
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: T20UI.spaceSize,
              right: T20UI.spaceSize - 4,
              left: T20UI.spaceSize - 4,
            ),
            child: MainButton(
              label: 'Crie um personagem',
              onTap: () async {},
            ),
          ),
          Padding(
            padding: T20UI.allPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Labels('Aventuras'),
                SimpleButton(
                  icon: FontAwesomeIcons.plus,
                  onTap: () {},
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: T20UI.spaceSize,
              right: T20UI.spaceSize - 4,
              left: T20UI.spaceSize - 4,
            ),
            child: MainButton(
              label: 'Crie uma aventura',
              onTap: () async {},
            ),
          ),
          Padding(
            padding: T20UI.allPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Labels('Ameaças'),
                SimpleButton(
                  icon: FontAwesomeIcons.plus,
                  onTap: () {},
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: T20UI.spaceSize,
              right: T20UI.spaceSize - 4,
              left: T20UI.spaceSize - 4,
            ),
            child: MainButton(
              label: 'Crie uma ameaça',
              onTap: () async {},
            ),
          ),
        ],
      ),
    );
  }
}
