import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/botom_sheet_add_edit_board_charcter_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_brood_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_classes_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_header.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_main_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_name_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_player_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_tokens.dart';
import 'package:tormenta20/src/shared/entities/board/board_character.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';

class BottomSheetAddEditBoardCharacter extends StatefulWidget {
  const BottomSheetAddEditBoardCharacter({super.key, this.character});

  final BoardCharacter? character;

  @override
  State<BottomSheetAddEditBoardCharacter> createState() =>
      _BottomSheetAddEditBoardCharacterState();
}

class _BottomSheetAddEditBoardCharacterState
    extends State<BottomSheetAddEditBoardCharacter> {
  final _formKey = GlobalKey<FormState>();

  late final BotomSheetAddEditBoardCharcterStore _store;

  @override
  void initState() {
    super.initState();
    _store = BotomSheetAddEditBoardCharcterStore(widget.character);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.allPaddingWithPaddingBottom(context),
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: palette.bottomSheetBackground,
              borderRadius: T20UI.borderRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BottomSheetAddEditBoardCharacterHeader(),
              const BottomSheetDivider(verticalPadding: 0),
              T20UI.spaceHeight,
              BottomSheetAddEditBoardCharacterTokens(store: _store),
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
                            child: BottomSheetAddEditBoardCharacterNameField(
                              onchange: _store.onChangeName,
                              initialTitle: _store.name,
                            ),
                          ),
                          T20UI.spaceWidth,
                          Expanded(
                            child: BottomSheetAddEditBoardCharacterPlayerField(
                              onchange: _store.onChangeName,
                              initialTitle: _store.player,
                            ),
                          ),
                        ],
                      ),
                    ),
                    T20UI.spaceHeight,
                    BottomSheetAddEditBoardCharacterBroodSelector(
                      store: _store,
                    ),
                    T20UI.spaceHeight,
                    BottomSheetAddEditBoardCharacterClassesSelector(
                      store: _store,
                    ),
                    T20UI.spaceHeight,
                  ],
                ),
              ),
              BottomSheetAddEditBoardCharacterMainButtons(
                onSave: () {
                  if (_formKey.currentState!.validate()) {
                    _store.onSave();
                    // final newLink = BoardLink(
                    //   boardUuid: widget.boardUuid,
                    //   uuid: widget.link?.uuid ?? const Uuid().v4(),
                    //   title: _title!,
                    //   link: _url!,
                    // );

                    // Navigator.pop(context, newLink);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
