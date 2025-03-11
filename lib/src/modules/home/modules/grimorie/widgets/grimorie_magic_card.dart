// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/widgets/magic_options_bottom_sheet/magic_options_bottom_sheet.dart';
import 'package:tormenta20/src/modules/home/modules/magic_selected/magic_selected.dart';
import 'package:tormenta20/src/modules/home/modules/magic_setup/magic_setup_screen.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character_ext.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';

class GrimorieMagicCard extends StatelessWidget {
  const GrimorieMagicCard({
    super.key,
    required this.magic,
    required this.onRemove,
    required this.onSetup,
  });

  final MagicCharacter magic;
  final Function(MagicCharacter) onRemove;
  final Function(MagicCharacter) onSetup;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        enableFeedback: false,
        onTap: () async {
          BottomsheetUtils.show<magicOptions?>(
            context: context,
            child: const MagicOptionsBottomSheet(),
          ).then((result) async {
            if (result == magicOptions.setup) {
              await Navigator.push<MagicCharacter?>(
                context,
                MaterialPageRoute(
                  builder: (_) => MagicSetupScreen(
                    magic: magic,
                  ),
                ),
              ).then((result) {
                if (result == null) return;

                onSetup(result);
              });
            }

            if (result == magicOptions.see) {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MagicSelected(
                    magic: magic,
                    enableGrimories: false,
                  ),
                ),
              );
            }

            if (result == magicOptions.delete) {
              onRemove(magic);
            }
          });
        },
        onLongPress: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MagicSelected(
                magic: magic,
                enableGrimories: false,
              ),
            ),
          );
        },
        borderRadius: T20UI.borderRadius,
        child: Padding(
          padding: const EdgeInsets.only(
            top: T20UI.smallSpaceSize,
            bottom: T20UI.smallSpaceSize,
            right: T20UI.smallSpaceSize,
            left: T20UI.spaceSize,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${magic.circle.level}˚',
                style: TextStyle(
                  fontSize: 34,
                  color: palette.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: T20UI.smallSpaceSize),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      magic.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      magic.desc,
                      maxLines: 2,
                      style: TextStyle(color: palette.textSecundary),
                    ),
                    if (!magic.needSetup)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            Text(
                              'PM: ${magic.pm}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: palette.accent,
                              ),
                            ),
                            const SizedBox(width: T20UI.smallSpaceSize),
                            Text(
                              'CD: ${magic.cd}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: palette.accent,
                              ),
                            ),
                            if (magic.damageDices != null ||
                                magic.extraDamageDices != null)
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: T20UI.smallSpaceSize),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.diceD20,
                                      color: palette.accent,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 4),
                                    if (magic.damageDices != null)
                                      Text(
                                        '${magic.damageDices}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: palette.accent,
                                        ),
                                      ),
                                    if (magic.damageDices != null &&
                                        magic.extraDamageDices != null)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        child: Icon(
                                          FontAwesomeIcons.plus,
                                          color: palette.accent,
                                          size: 12,
                                        ),
                                      ),
                                    if (magic.extraDamageDices != null)
                                      Text(
                                        '${magic.extraDamageDices}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: palette.accent,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            if (magic.mediumDamageValue != null)
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: T20UI.smallSpaceSize),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.explosion,
                                      color: palette.accent,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${magic.mediumDamageValue}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: palette.accent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
