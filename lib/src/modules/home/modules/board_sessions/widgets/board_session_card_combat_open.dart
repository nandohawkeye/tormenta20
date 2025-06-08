// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_combat/board_combat_screen.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';

class BoardSessionCardCombatOpen extends StatelessWidget {
  const BoardSessionCardCombatOpen(this.selectedCombat, {super.key});

  final BoardCombat selectedCombat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: T20UI.spaceSize),
      child: Card(
        color: palette.selected,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BoardCombatScreen(combat: selectedCombat),
              ),
            );
          },
          child: Padding(
            padding: T20UI.allPadding,
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.sword.path,
                    color: palette.icon,
                    height: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Combate rolando - ${selectedCombat.turn}º turno',
                    style: const TextStyle(
                      fontFamily: FontFamily.tormenta,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: T20UI.smallSpaceSize),
                  const Icon(FontAwesomeIcons.shieldHalved, size: 14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
