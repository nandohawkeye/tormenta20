import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';

class AddEditBoardSiteCardPrototype extends StatelessWidget {
  const AddEditBoardSiteCardPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: T20UI.horizontalPadding,
          child: SizedBox(
            width: double.infinity,
            child: Card(
              color: palette.cardBackground,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: T20UI.smallSpaceSize + 4, top: 6, bottom: 6),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.link,
                      size: 30,
                      color: palette.icon,
                    ),
                    T20UI.spaceWidth,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Titulo',
                            style: TextStyle(
                                fontFamily: FontFamily.tormenta, fontSize: 18),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'http://linktest.com.bt',
                            style: TextStyle(
                              color: palette.textDisable,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SimpleButton(
                      icon: FontAwesomeIcons.solidTrashCan,
                      backgroundColor: palette.backgroundLevelOne,
                      iconColor: palette.selected,
                      onTap: () {},
                      iconSize: 18,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        T20UI.smallSpaceHeight,
      ],
    );
  }
}
