import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_character_card.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_characters_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_player/bottom_sheet_add_edit_board_player.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardPlayers extends StatefulWidget {
  const AddEditBoardPlayers(this.controller, {super.key});

  final AddEditBoardController controller;

  @override
  State<AddEditBoardPlayers> createState() => _AddEditBoardPlayersState();
}

class _AddEditBoardPlayersState extends State<AddEditBoardPlayers> {
  late final AddEditBoardCharactersStore _store;

  @override
  void initState() {
    super.initState();
    _store = AddEditBoardCharactersStore(widget.controller);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void addEditPlayer(BoardPlayer? character) async {
      await showModalBottomSheet<BoardPlayer?>(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BottomSheetAddEditBoardPlayer(
            character: character,
            boardUuid: widget.controller.boardUuid,
          ),
        ),
      ).then(_store.addPlayer);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Jogadores'),
              Row(
                children: [
                  SimpleButton(
                    icon: FontAwesomeIcons.plus,
                    onTap: () => addEditPlayer(null),
                  ),
                  T20UI.spaceWidth,
                  SimpleButton(
                    icon: FontAwesomeIcons.solidFileCode,
                    onTap: () {},
                  )
                ],
              ),
            ],
          ),
        ),
        T20UI.spaceHeight,
        ValueListenableBuilder(
          valueListenable: _store.players,
          builder: (_, characters, __) {
            final list = characters ?? [];

            if (list.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: T20UI.spaceSize - 4,
                ),
                child: MainButton(
                  label: 'Adicionar jogador',
                  backgroundColor: palette.cardBackground,
                  onTap: () => addEditPlayer(null),
                ),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              itemCount: list.length,
              separatorBuilder: T20UI.separatorBuilderVertical,
              itemBuilder: (_, index) {
                return AddEditBoardCharacterCard(
                  player: list[index],
                  onRemove: _store.remove,
                  onSelect: addEditPlayer,
                );
              },
            );
          },
        )
      ],
    );
  }
}
