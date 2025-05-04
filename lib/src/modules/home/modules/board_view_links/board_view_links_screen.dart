import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_board_link/bottom_sheet_add_board_link.dart';
import 'package:tormenta20/src/modules/home/modules/board_view_links/board_view_links_store.dart';
import 'package:tormenta20/src/modules/home/modules/board_view_links/board_view_links_card.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/screen_save_main_buttons.dart';
import 'package:tormenta20/src/shared/widgets/screen_header.dart';

class BoardViewLinks extends StatefulWidget {
  const BoardViewLinks({super.key, required this.boardUuid});

  final String boardUuid;

  @override
  State<BoardViewLinks> createState() => _BoardViewLinksState();
}

class _BoardViewLinksState extends State<BoardViewLinks> {
  late final BoardLinksStore _store;

  @override
  void initState() {
    super.initState();
    _store = BoardLinksStore(widget.boardUuid);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  void _addEditSite(BoardLink? link) async {
    await BottomsheetUtils.show<BoardLink?>(
      context: context,
      child: BottomSheetAddBoardLink(
        link: link,
        boardUuid: widget.boardUuid,
      ),
    ).then(_store.add);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RepaintBoundary(child: ScreenHeader(label: 'Links')),
          const Divider(),
          Expanded(
            child: RepaintBoundary(
              child: ListenableBuilder(
                  listenable: _store,
                  builder: (_, __) {
                    final links = _store.links;

                    if (links.isEmpty) {
                      return const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(FontAwesomeIcons.ghost),
                            SizedBox(width: T20UI.smallSpaceSize),
                            Text(
                              'Nenhum link',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    links.sort((a, b) => a.title.compareTo(b.title));
                    return SingleChildScrollView(
                      padding: EdgeInsets.only(
                        left: T20UI.screenContentSpaceSize,
                        right: T20UI.screenContentSpaceSize,
                        bottom: T20UI.spaceSize +
                            MediaQuery.of(context).padding.bottom,
                        top: T20UI.spaceSize,
                      ),
                      child: Column(
                        children: [
                          ...links.map(
                            (link) => BoardViewLinksCard(
                              link,
                              onDelete: _store.deleteLink,
                              onSelected: _addEditSite,
                            ),
                          ),
                          T20UI.safeAreaBottom(context, additionalHeight: 40)
                        ],
                      ),
                    );
                  }),
            ),
          ),
          RepaintBoundary(
            child: ScreenSaveMainButtons(
              label: 'Adicionar link',
              onSave: () => _addEditSite(null),
            ),
          )
        ],
      ),
    );
  }
}
