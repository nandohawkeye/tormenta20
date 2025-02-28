import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class AboutOtherRightsReservedsCard extends StatelessWidget {
  const AboutOtherRightsReservedsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: T20UI.screenContentSpaceSize,
      ),
      child: Card(
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(T20UI.smallSpaceSize),
            child: Text(
              'Clique aqui para ver os direitos reservados de outros recursos usados no projeto',
              maxLines: 10,
            ),
          ),
        ),
      ),
    );
  }
}
