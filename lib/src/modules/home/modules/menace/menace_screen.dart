import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_screen.dart';
import 'package:tormenta20/src/modules/home/modules/menace/menace_store.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_action_card.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_atributes.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_expertises.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_header_image.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_header_infos.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_magic_card.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_skill_card.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_valid_text.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
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
          onSaveLabel: 'Opções',
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Row(
                children: [
                  T20UI.smallSpaceWidth,
                  MenaceHeaderImage(menace),
                  T20UI.spaceWidth,
                  MenaceHeaderInfos(menace),
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
              if (menace.desc != null || menace.extraInfos != null)
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(),
                  ],
                ),
              MenaceValidText(value: menace.desc),
              MenaceValidText(
                value: menace.extraInfos,
                textColor: palette.textSecundary,
              ),
              if (menace.actions.isNotEmpty)
                Column(
                  children: [
                    const Divider(),
                    ...menace.actions.map(MenaceActionCard.new),
                  ],
                ),
              if (menace.generalSkills.isNotEmpty)
                Column(
                  children: [
                    const Divider(),
                    ...menace.generalSkills.map(MenaceSkillCard.new),
                  ],
                ),
              if (menace.magics.isNotEmpty)
                Column(
                  children: [
                    const Divider(),
                    ...menace.magics.map(MenaceMagicCard.new),
                  ],
                ),
              if (menace.equipments.isNotEmpty)
                Column(
                  children: [
                    const Divider(),
                    ...menace.equipments.map(MenaceEquipmentCard.new),
                  ],
                ),
              MenaceExpertises(menace),
              T20UI.spaceHeight,
            ],
          ),
          onSave: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddEditMenaceScreen(
                  menace: menace,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
