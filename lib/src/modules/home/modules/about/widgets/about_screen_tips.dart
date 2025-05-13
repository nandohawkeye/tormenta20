import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_screen_simple_button.dart';
import 'package:tormenta20/src/modules/home/modules/intro/intro_screen.dart';
import 'package:tormenta20/src/shared/widgets/tips_text.dart';

class AboutScreenTips extends StatelessWidget {
  const AboutScreenTips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RepaintBoundary(
            child: Padding(
              padding: T20UI.horizontalPadding,
              child: AboutScreenSimpleButton(
                label: 'Ver introdução novamente',
                icon: FontAwesomeIcons.circleInfo,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IntroScreen(fromSplash: false),
                    ),
                  );
                },
              ),
            ),
          ),
          T20UI.spaceHeight,
          const RepaintBoundary(
            child: Padding(
              padding: T20UI.horizontalPadding,
              child: Card(
                child: Padding(
                  padding: T20UI.allPadding,
                  child: TipsText(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
