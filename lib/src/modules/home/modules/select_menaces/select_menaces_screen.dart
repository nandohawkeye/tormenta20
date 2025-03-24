// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_screen.dart';
import 'package:tormenta20/src/modules/home/modules/select_menaces/select_menaces_store.dart';
import 'package:tormenta20/src/modules/home/modules/select_menaces/widgets/select_menaces_screen_card.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class SelectMenacesScreen extends StatefulWidget {
  const SelectMenacesScreen(this.previousMenaces,
      {super.key, required this.boardUuid});

  final List<Menace> previousMenaces;
  final String boardUuid;

  @override
  State<SelectMenacesScreen> createState() => _SelectMenacesScreenState();
}

class _SelectMenacesScreenState extends State<SelectMenacesScreen> {
  late final SelectMenacesStore _store;

  @override
  void initState() {
    super.initState();
    _store = SelectMenacesStore(widget.boardUuid);
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
        final menaces = _store.menaces;
        final selecteds = _store.selectedMenaces;
        return ScreenBase(
          label: 'Selecione as ameaças',
          onSave: () async {
            if (menaces.isEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddEditMenaceScreen(),
                ),
              );
            } else {
              if (selecteds.isEmpty) return;

              final failiure = await _store.addLinkMenaceBoard();
              if (failiure == null) {
                Navigator.pop(context);
              }
            }
          },
          onSaveLabel: menaces.isEmpty ? 'Criar' : 'Confirmar',
          extraRightWidgets: menaces.isEmpty
              ? []
              : [
                  Padding(
                    padding: const EdgeInsets.only(left: T20UI.spaceSize),
                    child: SimpleButton(
                      icon: FontAwesomeIcons.plus,
                      iconColor: palette.icon,
                      backgroundColor: palette.selected,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddEditMenaceScreen(),
                          ),
                        );
                      },
                    ),
                  )
                ],
          body: menaces.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: context.height / 3),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.ghost),
                      T20UI.smallSpaceWidth,
                      Text('Nenhuma ameaça encontrada',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  padding: T20UI.horizontallScreenPadding.copyWith(
                    top: T20UI.spaceSize,
                  ),
                  itemCount: menaces.length,
                  separatorBuilder: T20UI.separatorBuilderVertical,
                  itemBuilder: (_, index) {
                    return SelectMenacesScreenCard(
                      menace: menaces[index],
                      previousMenaces: widget.previousMenaces,
                      selectedMenaces: selecteds,
                      onTap: _store.setSelectedMenace,
                    );
                  },
                ),
        );
      },
    );
  }
}
