import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_note_add_edit_bottomsheet/board_view_note_add_edit_bottomsheet_bottom_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_note_add_edit_bottomsheet/board_view_note_add_edit_bottomsheet_header.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_note_add_edit_bottomsheet/board_view_note_add_edit_bottomsheet_note_field.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:uuid/uuid.dart';

class BoardViewNoteAddEditBottomsheet extends StatefulWidget {
  const BoardViewNoteAddEditBottomsheet({
    super.key,
    this.note,
    required this.boardUuid,
  });

  final BoardNote? note;
  final String boardUuid;

  @override
  State<BoardViewNoteAddEditBottomsheet> createState() =>
      _BoardViewNoteAddEditBottomsheetState();
}

class _BoardViewNoteAddEditBottomsheetState
    extends State<BoardViewNoteAddEditBottomsheet> {
  final _formKey = GlobalKey<FormState>();
  late final ValueNotifier<bool> _isFavorited;
  void _changeFavorited() {
    _isFavorited.value = !_isFavorited.value;
  }

  String? _noteText;
  void _setNoteText(String? value) => _noteText = value;

  @override
  void initState() {
    super.initState();
    _setNoteText(widget.note?.note);
    _isFavorited = ValueNotifier<bool>(widget.note?.isFavorited ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RepaintBoundary(child: BoardViewNoteAddEditBottomsheetHeader()),
          const DividerLevelTwo(verticalPadding: 0),
          T20UI.spaceHeight,
          RepaintBoundary(
            child: Form(
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
                          child: BoardViewNoteAddEditBottomsheetNoteField(
                            onchange: _setNoteText,
                            initialNote: widget.note?.note,
                          ),
                        ),
                      ],
                    ),
                  ),
                  T20UI.spaceHeight,
                ],
              ),
            ),
          ),
          RepaintBoundary(
            child: ValueListenableBuilder(
              valueListenable: _isFavorited,
              builder: (_, isFavorited, __) {
                return BoardViewNoteAddEditBottomsheetBottomButtons(
                  isFavorited: isFavorited,
                  changeFavorited: _changeFavorited,
                  onSave: () {
                    if (_formKey.currentState!.validate()) {
                      final updateAt = DateTime.now();

                      final newNote = BoardNote(
                          boardUuid: widget.boardUuid,
                          uuid: widget.note?.uuid ?? const Uuid().v4(),
                          note: _noteText!,
                          isFavorited: _isFavorited.value,
                          updatedAt: updateAt,
                          createdAt: widget.note?.createdAt ?? updateAt);

                      Navigator.pop(context, newNote);
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
