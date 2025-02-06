// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class MagicBottomsheetGrimorieCard extends StatelessWidget {
  const MagicBottomsheetGrimorieCard({
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
        color: palette.backgroundLevelTwo,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          splashColor: Color(grimoire.colorInt).withOpacity(.4),
          onTap: () => onTap(grimoire),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: T20UI.spaceSize / 2,
              horizontal: T20UI.spaceSize / 2,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    'assets/icons/${grimoire.iconAsset}.svg',
                    color: Color(grimoire.colorInt),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  grimoire.name,
                  style: TextStyle(
                    fontFamily: 'tormenta',
                    color: Color(grimoire.colorInt),
                    fontSize: 18,
                  ),
                ),
                T20UI.spaceWidth,
                CustomChecked(
                  color: Color(grimoire.colorInt),
                  value: grimoire.magicsCharacters.any((m) => m.id == magic.id),
                  isEnabledToTap: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
