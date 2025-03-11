import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/menace_card/menace_card_image.dart';
import 'package:tormenta20/src/modules/home/modules/menace/menace_store.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_atributes.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/utils/combat_role_utils.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';
import 'package:tormenta20/src/shared/utils/menace_utils.dart';
import 'package:tormenta20/src/shared/utils/treasure_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class MenaceScreen extends StatefulWidget {
  const MenaceScreen({super.key, required this.menace});

  final Menace menace;

  @override
  State<MenaceScreen> createState() => _MenaceScreenState();
}

class _MenaceScreenState extends State<MenaceScreen> {
  late final MenaceStore _store;

  @override
  void initState() {
    super.initState();
    _store = MenaceStore(widget.menace);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _store,
      builder: (_, __) {
        final menace = _store.menace;
        return ScreenBase(
          label: '${menace.name} - ND ${menace.nd}',
          onSaveLabel: 'Adicionar á mesa',
          body: Column(
            children: [
              T20UI.spaceHeight,
              Row(
                children: [
                  T20UI.smallSpaceWidth,
                  MenaceCardImage(
                    menace,
                    size: 80,
                  ),
                  T20UI.spaceWidth,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        '${CombatRoleUtils.handleTitle(menace.combatRole.name)} - ${MenaceUtils.handleMenaceTitle(menace.type.name)} - ${CreatureSizeUtils.handleTitle(menace.creatureSize.name)}',
                        style: TextStyle(
                            color: palette.textSecundary,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'FORT: ${menace.fortResistence} - REF: ${menace.refResistence} - VON: ${menace.vonResistence}',
                            maxLines: 2,
                            style: TextStyle(
                                color: palette.textSecundary,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.shieldHalved,
                            size: 14,
                            color: palette.textSecundary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            menace.defense.toString().padLeft(2, '0'),
                            maxLines: 2,
                            style: TextStyle(
                                color: palette.textSecundary,
                                fontWeight: FontWeight.w500),
                          ),
                          T20UI.spaceWidth,
                          Icon(
                            FontAwesomeIcons.solidHeart,
                            size: 14,
                            color: palette.textSecundary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            menace.life.toString().padLeft(2, '0'),
                            maxLines: 2,
                            style: TextStyle(
                                color: palette.textSecundary,
                                fontWeight: FontWeight.w500),
                          ),
                          T20UI.spaceWidth,
                          Icon(
                            FontAwesomeIcons.handSparkles,
                            size: 14,
                            color: palette.textSecundary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            menace.mana.toString().padLeft(2, '0'),
                            maxLines: 2,
                            style: TextStyle(
                                color: palette.textSecundary,
                                fontWeight: FontWeight.w500),
                          ),
                          T20UI.spaceWidth,
                          Icon(
                            FontAwesomeIcons.personRunning,
                            size: 14,
                            color: palette.textSecundary,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            menace.initiative.toString().padLeft(2, '0'),
                            maxLines: 2,
                            style: TextStyle(
                                color: palette.textSecundary,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.solidGem,
                            size: 14,
                            color: palette.textSecundary,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            TreasureTypeUtils.handleMenaceTitle(
                                menace.treasures?.name ?? 'none'),
                            maxLines: 2,
                            style: TextStyle(
                                color: palette.textSecundary,
                                fontWeight: FontWeight.w500),
                          ),
                          T20UI.spaceWidth,
                          if (menace.displacement?.isNotEmpty ?? false)
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.personWalking,
                                  size: 14,
                                  color: palette.textSecundary,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  menace.displacement ?? '',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: palette.textSecundary,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                        ],
                      )
                    ],
                  )
                ],
              ),
              T20UI.spaceHeight,
              const Divider(),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontallScreenPadding,
                child: MenaceAtributes(menace),
              ),
              T20UI.spaceHeight,
              const Divider(),
            ],
          ),
          extraRightWidgets: [
            SimpleButton(
              icon: FontAwesomeIcons.bars,
              iconColor: palette.icon,
              onTap: () {},
            ),
            T20UI.spaceWidth,
          ],
          onSave: () {},
        );
      },
    );
  }
}
