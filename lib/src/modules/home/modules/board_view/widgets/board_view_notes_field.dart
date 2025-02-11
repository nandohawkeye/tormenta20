import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_notes/board_notes_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_note_add_edit_bottomsheet/board_view_note_add_edit_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class BoardViewNotesField extends StatelessWidget {
  const BoardViewNotesField(this.board, {super.key});

  final Board board;

  @override
  Widget build(BuildContext context) {
    void addEditNote() async {
      await showModalBottomSheet<BoardNote?>(
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: false,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BoardViewNoteAddEditBottomsheet(
            boardUuid: board.uuid,
          ),
        ),
      ).then((note) {
        if (note != null) {
          GetIt.I<AppDatabase>().boardDAO.saveNote(note);
        }
      });
    }

    final notes = board.notes;
    final favoritedsNotes = notes.where((note) => note.isFavorited);
    void showNodes() async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BoardNotesScreen(
            boardUuid: board.uuid,
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        Padding(
          padding: T20UI.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Anotações'),
              SimpleButton(
                icon: FontAwesomeIcons.plus,
                onTap: addEditNote,
              ),
            ],
          ),
        ),
        T20UI.spaceHeight,
        Padding(
          padding: const EdgeInsets.only(
            bottom: T20UI.spaceSize,
            right: T20UI.spaceSize - 4,
            left: T20UI.spaceSize - 4,
          ),
          child: ScreenImageButton(
            imageAsset: Assets.images.manuscript.path,
            title: 'Anotações',
            subtitle: notes.isNotEmpty
                ? 'Você tem ${notes.length.toString().padLeft(2, '0')} anotações${favoritedsNotes.isNotEmpty ? ' sendo ${favoritedsNotes.length.toString().padLeft(2, '0')} delas favoritadas' : ''} sobre essa mesa. Clique aqui para vê-las.'
                : 'Crie anotações sobre esta mesa e consulte toda vez que precisar',
            onTap: notes.isNotEmpty ? showNodes : addEditNote,
          ),
        )
      ],
    );
  }
}
