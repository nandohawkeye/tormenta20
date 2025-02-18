import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_board_link/bottom_sheet_add_board_link.dart';
import 'package:tormenta20/src/modules/home/modules/board_view_links/board_view_links_store.dart';
import 'package:tormenta20/src/modules/home/modules/board_view_links/board_view_links_card.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

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
    await showModalBottomSheet<BoardLink?>(
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: false,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BottomSheetAddBoardLink(
          link: link,
          boardUuid: widget.boardUuid,
        ),
      ),
    ).then(_store.add);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _store,
      builder: (_, __) {
        final links = _store.links;

        links.sort((a, b) => a.title.compareTo(b.title));

        return Scaffold(
          body: Column(
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
                    child: Labels('Links'),
                  ),
                  T20UI.spaceHeight,
                ],
              ),
              const Divider(),
              Expanded(
                child: links.isEmpty
                    ? const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(FontAwesomeIcons.ghost),
                            SizedBox(width: T20UI.spaceSize / 2),
                            Text(
                              'Nenhum link',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        padding: EdgeInsets.only(
                          left: T20UI.spaceSize - 4,
                          right: T20UI.spaceSize - 4,
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
                      ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ColoredBox(
                  color: palette.background,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: T20UI.spaceSize,
                          left: T20UI.spaceSize,
                          right: T20UI.spaceSize,
                          bottom: MediaQuery.of(context).padding.bottom +
                              T20UI.spaceSize,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: MainButton(
                                label: "Adicionar link",
                                onTap: () => _addEditSite(null),
                              ),
                            ),
                            T20UI.spaceWidth,
                            const SimpleCloseButton()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
