import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/botom_sheet_add_edit_board_player_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_baord_player_mana_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_board_player_brood_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_board_player_classes_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_board_player_defense_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_board_player_header.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_board_player_life_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_board_player_main_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_board_player_name_character_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_board_player_name_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_board_player_tokens.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';
import 'package:tormenta20/src/shared/widgets/default_brackdrop_filter.dart';

class BottomSheetAddEditBoardPlayer extends StatefulWidget {
  const BottomSheetAddEditBoardPlayer({
    super.key,
    this.character,
    required this.boardUuid,
  });

  final BoardPlayer? character;
  final String boardUuid;

  @override
  State<BottomSheetAddEditBoardPlayer> createState() =>
      _BottomSheetAddEditBoardPlayerState();
}

class _BottomSheetAddEditBoardPlayerState
    extends State<BottomSheetAddEditBoardPlayer> {
  final _formKey = GlobalKey<FormState>();

  late final BotomSheetAddEditBoardPlayerStore _store;

  @override
  void initState() {
    super.initState();
    _store = BotomSheetAddEditBoardPlayerStore(
      widget.character,
      widget.boardUuid,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final limite = ((height - kToolbarHeight) / height);
    final initialSize = (limite * .87);

    return Stack(
      children: [
        const DefaultBrackdropFilter(),
        DraggableScrollableSheet(
          maxChildSize: limite,
          initialChildSize: initialSize,
          builder: (context, scrollController) {
            return Padding(
              padding: T20UI.allPaddingWithPaddingBottom(context),
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: palette.backgroundLevelOne,
                      borderRadius: T20UI.borderRadius),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BottomSheetAddEditBoardPlayerHeader(),
                      const BottomSheetDivider(verticalPadding: 0),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              T20UI.spaceHeight,
                              BottomSheetAddEditBoardPlayerTokens(
                                  store: _store, size: 80),
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
                                            child:
                                                BottomSheetAddEditBoardPlayerNameField(
                                              onchange: _store.onChangePlayer,
                                              initialTitle: _store.player,
                                            ),
                                          ),
                                          T20UI.spaceWidth,
                                          Expanded(
                                            child:
                                                BottomSheetAddEditBoardPlayerNamecharacterField(
                                              onchange:
                                                  _store.onChangeCharacter,
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
                                            child:
                                                BottomSheetAddEditBoardPlayerLifeField(
                                              onchange: _store.onChangeLife,
                                              initialLife: _store.life,
                                            ),
                                          ),
                                          T20UI.spaceWidth,
                                          Expanded(
                                            child:
                                                BottomSheetAddEditBoardPlayerManaField(
                                              onchange: _store.onChangeMana,
                                              initialMana: _store.mana,
                                            ),
                                          ),
                                          T20UI.spaceWidth,
                                          Expanded(
                                            child:
                                                BottomSheetAddEditBoardPlayerDefenseField(
                                              onchange: _store.onChangeDefense,
                                              initialDefense: _store.defense,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    T20UI.spaceHeight,
                                    BottomSheetAddEditBoardPlayerBroodSelector(
                                      store: _store,
                                    ),
                                    T20UI.spaceHeight,
                                    BottomSheetAddEditBoardPlayerClassesSelector(
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
                      BottomSheetAddEditBoardPlayerMainButtons(
                        onSave: () {
                          if (_formKey.currentState!.validate()) {
                            final result = _store.onSave();
                            if (result != null) {
                              Navigator.pop(context, result);
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
