// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class MagicSelectedGrimorieCard extends StatelessWidget {
  const MagicSelectedGrimorieCard({
    super.key,
    required this.grimoire,
    required this.magic,
    required this.onTap,
  });

  final Grimoire grimoire;
  final Magic magic;
  final Function(Grimoire) onTap;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Card(
        color: palette.backgroundLevelOne,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () => onTap(grimoire),
          child: SizedBox(
            height: T20UI.inputHeight,
            child: Padding(
              padding: T20UI.horizontalPadding,
              child: Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      grimoire.iconAsset,
                      color: palette.selected,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    grimoire.name,
                    style: TextStyle(
                      fontFamily: 'tormenta',
                      color: palette.selected,
                      fontSize: 18,
                    ),
                  ),
                  T20UI.spaceWidth,
                  CustomChecked(
                    value:
                        grimoire.magicsCharacters.any((m) => m.id == magic.id),
                    isEnabledToTap: false,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
