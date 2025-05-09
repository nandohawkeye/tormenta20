import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_screen_simple_button.dart';
import 'package:tormenta20/src/modules/home/modules/intro/intro_screen.dart';
import 'package:tormenta20/src/modules/home/widgets/tip_home_bottomsheet/tip_home_bottomsheet.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';

class AboutScreenSimpleButtons extends StatelessWidget {
  const AboutScreenSimpleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontallScreenPadding,
      child: Row(
        children: [
          AboutScreenSimpleButton(
            label: 'Introdução',
            icon: FontAwesomeIcons.circleInfo,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const IntroScreen(fromSplash: false)));
            },
          ),
          T20UI.spaceWidth,
          AboutScreenSimpleButton(
            label: 'Dicas',
            icon: FontAwesomeIcons.solidLightbulb,
            onTap: () {
              BottomsheetUtils.show(
                context: context,
                child: const TipHomeBottomsheet(),
              );
            },
          ),
          // T20UI.spaceWidth,
          // AboutScreenSimpleButton(
          //   label: 'Compartilhe',
          //   icon: FontAwesomeIcons.shareNodes,
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
