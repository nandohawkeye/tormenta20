import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_screen.dart';
import 'package:tormenta20/src/modules/home/modules/menace/menace_store.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/clone_menace_bottomsheet/clone_menace_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/delete_menace_bottomsheet/delete_menace_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_actions.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_atributes.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_boards_field/menace_boards_field.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipments.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_expertises.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_header_image.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_header_infos.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_magics.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_options_bottomsheet/menace_options_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_skills.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_tabs/menace_tabs.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_valid_text.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class MenaceScreen extends StatefulWidget {
  const MenaceScreen({super.key, required this.menace});

  final Menace menace;

  @override
  State<MenaceScreen> createState() => _MenaceScreenState();
}

class _MenaceScreenState extends State<MenaceScreen> {
  late final MenaceStore _store;

  void forcePopScreen() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _store = MenaceStore(widget.menace);
    _store.forcePopScreen = forcePopScreen;
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void callEdit(Menace menace) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AddEditMenaceScreen(
            menace: menace,
          ),
        ),
      );
    }

    void callRemove() async {
      await BottomsheetUtils.show<bool?>(
        context: context,
        child: const DeleteMenaceBottomsheet(),
      ).then((result) async {
        if (result != null && result) {
          _store.deleteMenace();
        }
      });
    }

    callClone(Menace menace) async {
      await BottomsheetUtils.show(
        context: context,
        child: CloneMenaceBottomsheet(menace),
      );
    }

    return AnimatedBuilder(
      animation: _store,
      builder: (_, __) {
        final menace = _store.menace;
        return ScreenBase(
          label: '${menace.name} - ND ${menace.nd}',
          onSaveLabel: 'Opções',
          extraTopWidgets: [
            const Divider(),
            T20UI.spaceHeight,
            AnimatedBuilder(
              animation: _store,
              builder: (_, __) {
                final selected = _store.tabIndex;
                return MenaceTabs(
                  selected: selected,
                  changeTabIndex: _store.changeTabIndex,
                );
              },
            ),
            T20UI.spaceHeight,
          ],
          body: Column(
            mainAxisSize: MainAxisSize.min,
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
              const Divider(),
              MenaceValidText(value: menace.desc),
              MenaceValidText(
                value: menace.extraInfos,
                textColor: palette.textSecundary,
              ),
              MenaceBoardsField(_store),
              AnimatedBuilder(
                animation: _store,
                builder: (_, __) {
                  final index = _store.tabIndex;

                  if (index == 0) {
                    return MenaceActions(menace.actions);
                  }

                  if (index == 1) {
                    return MenaceSkills(menace.generalSkills);
                  }

                  if (index == 2) {
                    return MenaceMagics(menace.magics);
                  }

                  if (index == 3) {
                    return MenaceEquipments(menace.equipments);
                  }

                  return MenaceExpertises(menace.expertises);
                },
              ),
              T20UI.spaceHeight,
            ],
          ),
          onSave: () async {
            await BottomsheetUtils.show<MenaceOption?>(
              context: context,
              child: const MenaceOptionsBottomsheet(),
            ).then((result) async {
              if (result == MenaceOption.edit) {
                callEdit(menace);
              }

              if (result == MenaceOption.delete) {
                callRemove();
              }

              if (result == MenaceOption.clone) {
                callClone(menace);
              }

              if (result == MenaceOption.export) {}
            });
          },
        );
      },
    );
  }
}
