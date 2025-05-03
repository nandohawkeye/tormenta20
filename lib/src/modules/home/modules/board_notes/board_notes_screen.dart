import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_notes/board_note_card.dart';
import 'package:tormenta20/src/modules/home/modules/board_notes/board_notes_store.dart';
import 'package:tormenta20/src/modules/home/modules/board_notes/detete_note_bottomsheet/delete_note_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_note_add_edit_bottomsheet/board_view_note_add_edit_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class BoardNotesScreen extends StatefulWidget {
  const BoardNotesScreen({super.key, required this.boardUuid});

  final String boardUuid;

  @override
  State<BoardNotesScreen> createState() => _BoardNotesScreenState();
}

class _BoardNotesScreenState extends State<BoardNotesScreen> {
  late final BoardNotesStore _store;

  @override
  void initState() {
    super.initState();
    _store = BoardNotesStore(widget.boardUuid);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  void _addEditNote(BoardNote? initial) async {
    await BottomsheetUtils.show<BoardNote?>(
      context: context,
      child: BoardViewNoteAddEditBottomsheet(
        boardUuid: widget.boardUuid,
        note: initial,
      ),
    ).then((note) async {
      if (note != null) {
        await _store.saveNote(note);
      }
    });
  }

  void _deleteNote(BoardNote note) async {
    await BottomsheetUtils.show<bool?>(
      context: context,
      child: const DeleteNoteBottomsheet(),
    ).then((result) async {
      if (result != null) {
        await _store.deleteNote(note);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: palette.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kTextTabBarHeight + T20UI.spaceSize),
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: Labels('Anotações'),
              ),
              T20UI.spaceHeight,
            ],
          ),
          const Divider(),
          Expanded(
            child: AnimatedBuilder(
              animation: _store,
              builder: (_, __) {
                final notes = _store.notes;

                if (notes.isEmpty) {
                  return const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(FontAwesomeIcons.ghost),
                        SizedBox(width: T20UI.smallSpaceSize),
                        Text(
                          'Nenhuma anotação',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                notes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
                return ListView.separated(
                  padding: const EdgeInsets.only(
                    left: T20UI.screenContentSpaceSize,
                    right: T20UI.screenContentSpaceSize,
                    bottom: T20UI.spaceSize,
                    top: T20UI.spaceSize,
                  ),
                  itemCount: notes.length,
                  separatorBuilder: T20UI.separatorBuilderVertical,
                  itemBuilder: (_, index) => BoardNoteCard(
                    note: notes[index],
                    onRemove: _deleteNote,
                    onSelected: _addEditNote,
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              Padding(
                padding: T20UI.allPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MainButton(
                        label: 'Criar',
                        onTap: () => _addEditNote(null),
                      ),
                    ),
                    T20UI.spaceWidth,
                    AnimatedBuilder(
                      animation: _store,
                      builder: (_, __) {
                        final onliFavoriteds = _store.onliFavoriteds;
                        return SimpleButton(
                          icon: onliFavoriteds
                              ? FontAwesomeIcons.star
                              : FontAwesomeIcons.solidStar,
                          backgroundColor: palette.selected,
                          iconColor: palette.indicator,
                          onTap: _store.changeOnlyFavorited,
                        );
                      },
                    ),
                    const SimpleCloseButton()
                  ],
                ),
              ),
            ],
          ),
          T20UI.safeAreaBottom(context),
        ],
      ),
    );
  }
}
