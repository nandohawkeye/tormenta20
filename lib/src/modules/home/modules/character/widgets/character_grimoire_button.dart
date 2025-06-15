// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';

class CharacterGrimoireButton extends StatelessWidget {
  const CharacterGrimoireButton(
    this.grimoire, {
    super.key,
    required this.onTap,
  });

  final Grimoire grimoire;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: T20UI.inputHeight,
      width: T20UI.inputHeight,
      child: Card(
        color: palette.selected,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: onTap,
          child: Center(
            child: SvgPicture.asset(
              grimoire.iconAsset,
              color: palette.icon,
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
