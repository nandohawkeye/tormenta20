import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_tabs/character_tab_card.dart';

class CharacterRecordTabs extends StatelessWidget {
  const CharacterRecordTabs({
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
            label: 'Principal',
            tabIndex: 0,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          CharacterTabCard(
            label: 'Ações',
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
            label: 'Perícias',
            tabIndex: 3,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          CharacterTabCard(
            label: 'Equipamentos',
            tabIndex: 4,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          CharacterTabCard(
            label: 'Origens',
            tabIndex: 5,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          CharacterTabCard(
            label: 'Condições',
            tabIndex: 6,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          CharacterTabCard(
            label: 'Mod. globais',
            tabIndex: 7,
            selected: selected,
            onTap: changeTabIndex,
          ),
          T20UI.smallSpaceWidth,
          CharacterTabCard(
            label: 'Outros',
            tabIndex: 8,
            selected: selected,
            onTap: changeTabIndex,
          ),
        ],
      ),
    );
  }
}
