import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/widgets/app_logo.dart';

class MagicsScreen extends StatelessWidget {
  const MagicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogo(
          height: 48,
          width: 150,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: T20UI.allPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Labels('Grimórios'),
                SimpleButton(
                  icon: FontAwesomeIcons.plus,
                  onTap: () {},
                )
              ],
            ),
          ),
          Padding(
            padding: T20UI.allPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Labels('Magias'),
                SimpleButton(
                  icon: FontAwesomeIcons.magnifyingGlass,
                  onTap: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
