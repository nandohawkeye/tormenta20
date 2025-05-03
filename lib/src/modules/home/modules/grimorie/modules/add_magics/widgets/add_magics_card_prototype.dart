import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_card/magic_card_indicator_search.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class AddMagicsCardPrototype extends StatelessWidget {
  const AddMagicsCardPrototype({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nome', style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Wrap(
                            runSpacing: 6,
                            spacing: 16,
                            children: [
                              MagicCardIndicatorSearch(
                                icon: FontAwesomeIcons.locationCrosshairs,
                                label: 'no alvo/área/efeito',
                              ),
                              MagicCardIndicatorSearch(
                                icon: FontAwesomeIcons.scroll,
                                label: 'na descrição',
                              ),
                              MagicCardIndicatorSearch(
                                icon: FontAwesomeIcons.bookOpen,
                                label: 'na publicação',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomChecked(
                    value: true,
                    isEnabledToTap: false,
                  )
                ],
              ),
            ),
          ),
        ),
        T20UI.smallSpaceHeight
      ],
    );
  }
}
