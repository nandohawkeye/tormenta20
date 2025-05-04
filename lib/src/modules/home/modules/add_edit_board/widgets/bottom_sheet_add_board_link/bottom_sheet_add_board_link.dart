import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_board_link/bottom_sheet_add_board_link_header.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_board_link/bottom_sheet_add_board_link_main_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_board_link/bottom_sheet_add_board_link_title_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_board_link/bottom_sheet_add_board_link_url_field.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:uuid/uuid.dart';

class BottomSheetAddBoardLink extends StatefulWidget {
  const BottomSheetAddBoardLink({
    super.key,
    this.link,
    required this.boardUuid,
  });

  final BoardLink? link;
  final String boardUuid;

  @override
  State<BottomSheetAddBoardLink> createState() =>
      _BottomSheetAddBoardLinkState();
}

class _BottomSheetAddBoardLinkState extends State<BottomSheetAddBoardLink> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  void _setTitle(String? value) => _title = value;

  String? _url;
  void _setURL(String? value) => _url = value;

  @override
  void initState() {
    super.initState();
    _setTitle(widget.link?.title);
    _setURL(widget.link?.link);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RepaintBoundary(child: BottomSheetAddBoardLinkHeader()),
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
                          child: BottomSheetAddBoardLinkTitleField(
                            onchange: _setTitle,
                            initialTitle: widget.link?.title,
                          ),
                        ),
                        T20UI.spaceWidth,
                        Expanded(
                          child: BottomSheetAddBoardLinkURLField(
                            onchange: _setURL,
                            initialTitle: widget.link?.link,
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
            child: BottomSheetAddBoardLinkMainButtons(
              onSave: () {
                if (_formKey.currentState!.validate()) {
                  final newLink = BoardLink(
                    boardUuid: widget.boardUuid,
                    uuid: widget.link?.uuid ?? const Uuid().v4(),
                    title: _title!,
                    link: _url!,
                  );

                  Navigator.pop(context, newLink);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
