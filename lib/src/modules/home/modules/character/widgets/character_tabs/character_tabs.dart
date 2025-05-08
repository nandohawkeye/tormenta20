import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_tabs/character_tab_card.dart';

class CharacterTabs extends StatelessWidget {
  const CharacterTabs({
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
          CharacterTabCard(
            label: 'Ações',
            tabIndex: 0,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          CharacterTabCard(
            label: 'Equipamentos',
            tabIndex: 1,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          CharacterTabCard(
            label: 'Poderes',
            tabIndex: 2,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          CharacterTabCard(
            label: 'Origens',
            tabIndex: 3,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          CharacterTabCard(
            label: 'Pericías treinadas',
            tabIndex: 4,
            selected: selected,
            onTap: changeTabIndex,
          ),
        ],
      ),
    );
  }
}
