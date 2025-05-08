import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_tabs/menace_tab_card.dart';

class MenaceTabs extends StatelessWidget {
  const MenaceTabs({
    super.key,
    required this.selected,
    required this.changeTabIndex,
  });

  final int selected;
  final Function(int) changeTabIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: T20UI.inputHeight,
      child: ListView(
        padding: T20UI.horizontallScreenPadding,
        scrollDirection: Axis.horizontal,
        children: [
          MenaceTabCard(
            label: 'Ações',
            tabIndex: 0,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          MenaceTabCard(
            label: 'Habilidades',
            tabIndex: 1,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          MenaceTabCard(
            label: 'Magias',
            tabIndex: 2,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          MenaceTabCard(
            label: 'Equipamentos',
            tabIndex: 3,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          MenaceTabCard(
            label: 'Pericías',
            tabIndex: 4,
            selected: selected,
            onTap: changeTabIndex,
          ),
        ],
      ),
    );
  }
}
