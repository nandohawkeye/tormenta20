// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/add_edit_character.dart';
import 'package:tormenta20/src/modules/home/modules/select_character/select_character_store.dart';
import 'package:tormenta20/src/modules/home/modules/select_character/widgets/select_character_screen_card.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class SelectCharacterScreen extends StatefulWidget {
  const SelectCharacterScreen({super.key, required this.boardUuid});

  final String boardUuid;

  @override
  State<SelectCharacterScreen> createState() => _SelectCharacterScreenState();
}

class _SelectCharacterScreenState extends State<SelectCharacterScreen> {
  late final SelectCharacterStore _store;

  @override
  void initState() {
    super.initState();
    _store = SelectCharacterStore(widget.boardUuid);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _store,
      builder: (_, __) {
        final characters = _store.characters;
        final selected = _store.selected;
        return ScreenBase(
          label: 'Selecione o personagem',
          onSave: () async {
            if (characters.isEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddEditCharacter()),
              );
            } else {
              if (selected == null) return;

              final failiure = await _store.saveCharacterBoard(selected);

              if (failiure == null) {
                Navigator.pop(context);
              }
            }
          },
          onSaveLabel: characters.isEmpty ? 'Criar' : 'Confirmar',
          extraRightWidgets: characters.isEmpty
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
                            builder: (_) => const AddEditCharacter(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
          body: characters.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: context.height / 3),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.ghost),
                      T20UI.smallSpaceWidth,
                      Text(
                        'Nenhum personagem encontrado',
                        style: TextStyle(fontSize: 16),
                      ),
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
                  itemCount: characters.length,
                  separatorBuilder: T20UI.separatorBuilderVertical,
                  itemBuilder: (_, index) {
                    return SelectCharacterScreenCard(
                      character: characters[index],
                      selected: selected,
                      onTap: _store.setSelectedCharacter,
                    );
                  },
                ),
        );
      },
    );
  }
}
