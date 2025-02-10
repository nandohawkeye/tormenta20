import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_baord_player_mana_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_brood_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_classes_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_defense_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_header.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_life_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_main_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_name_character_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_name_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_tokens.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';

class AddEditBoardPlayerCharacter extends StatefulWidget {
  const AddEditBoardPlayerCharacter({
    super.key,
    this.character,
    required this.boardUuid,
  });

  final BoardPlayer? character;
  final String boardUuid;

  @override
  State<AddEditBoardPlayerCharacter> createState() =>
      _AddEditBoardPlayerCharacterState();
}

class _AddEditBoardPlayerCharacterState
    extends State<AddEditBoardPlayerCharacter> {
  final _formKey = GlobalKey<FormState>();

  late final AddEditBoardPlayerStore _store;

  @override
  void initState() {
    super.initState();
    _store = AddEditBoardPlayerStore(
      widget.character,
      widget.boardUuid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: palette.background,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kTextTabBarHeight + T20UI.spaceSize),
            const AddEditBoardPlayerHeader(),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    T20UI.spaceHeight,
                    AddEditBoardPlayerTokens(
                      store: _store,
                      size: 80,
                    ),
                    T20UI.spaceHeight,
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: T20UI.horizontalPadding,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AddEditBoardPlayerNameField(
                                    onchange: _store.onChangePlayer,
                                    initialTitle: _store.player,
                                  ),
                                ),
                                T20UI.spaceWidth,
                                Expanded(
                                  child: AddEditBoardPlayerNamecharacterField(
                                    onchange: _store.onChangeCharacter,
                                    initialTitle: _store.name,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          T20UI.spaceHeight,
                          Padding(
                            padding: T20UI.horizontalPadding,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AddEditBoardPlayerLifeField(
                                    onchange: _store.onChangeLife,
                                    initialLife: _store.life,
                                  ),
                                ),
                                T20UI.spaceWidth,
                                Expanded(
                                  child: AddEditBoardPlayerManaField(
                                    onchange: _store.onChangeMana,
                                    initialMana: _store.mana,
                                  ),
                                ),
                                T20UI.spaceWidth,
                                Expanded(
                                  child: AddEditBoardPlayerDefenseField(
                                    onchange: _store.onChangeDefense,
                                    initialDefense: _store.defense,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          T20UI.spaceHeight,
                          AddEditBoardPlayerBroodSelector(
                            store: _store,
                          ),
                          T20UI.spaceHeight,
                          AddEditBoardPlayerClassesSelector(
                            store: _store,
                          ),
                          T20UI.spaceHeight,
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            AddEditBoardPlayerMainButtons(
              onSave: () {
                if (_formKey.currentState!.validate()) {
                  final result = _store.onSave();
                  if (result != null) {
                    Navigator.pop(context, result);
                  }
                }
              },
            ),
            T20UI.safeAreaBottom(context)
          ],
        ),
      ),
    );
  }
}
