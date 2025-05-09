import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_developer_card.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_label.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_other_rights_reserveds_card.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_publisher_card.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_screen_simple_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_version_info.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';

class AboutScreenInfos extends StatelessWidget {
  const AboutScreenInfos({super.key});

  @override
  Widget build(BuildContext context) {
    const space = T20UI.spaceHeight;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RepaintBoundary(child: AboutScreenSimpleButtons()),
          space,
          const RepaintBoundary(child: AboutLabel()),
          space,
          const RepaintBoundary(
            child: Padding(
              padding: T20UI.allPadding,
              child: Labels('Desenvolvedor'),
            ),
          ),
          const RepaintBoundary(child: AboutDeveloperCard()),
          space,
          const RepaintBoundary(
            child: Padding(
              padding: T20UI.allPadding,
              child: Labels('Editora'),
            ),
          ),
          const RepaintBoundary(child: AboutPublisherCard()),
          space,
          const RepaintBoundary(
            child: Padding(
              padding: T20UI.allPadding,
              child: Labels('Outros direitos reservados'),
            ),
          ),
          const RepaintBoundary(child: AboutOtherRightsReservedsCard()),
          const SizedBox(height: T20UI.spaceSize * 2),
          const RepaintBoundary(child: AboutVersionInfo()),
          SizedBox(
              height: MediaQuery.of(context).padding.bottom + T20UI.spaceSize)
        ],
      ),
    );
  }
}
