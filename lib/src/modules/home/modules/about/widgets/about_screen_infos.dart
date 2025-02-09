import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_developer_card.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_label.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_other_rights_reserveds_card.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_publisher_card.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';

class AboutScreenInfos extends StatelessWidget {
  const AboutScreenInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AboutLabel(),
          T20UI.spaceHeight,
          const Padding(
            padding: T20UI.allPadding,
            child: Labels('Desenvolvedor'),
          ),
          const AboutDeveloperCard(),
          T20UI.spaceHeight,
          const Padding(
            padding: T20UI.allPadding,
            child: Labels('Editora'),
          ),
          const AboutPublisherCard(),
          T20UI.spaceHeight,
          const Padding(
            padding: T20UI.allPadding,
            child: Labels('Outros direitos reservados'),
          ),
          const AboutOtherRightsReservedsCard(),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + T20UI.spaceSize,
          )
        ],
      ),
    );
  }
}
