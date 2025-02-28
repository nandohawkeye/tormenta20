import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_site_card.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_sites_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_board_link/bottom_sheet_add_board_link.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardLinks extends StatefulWidget {
  const AddEditBoardLinks(
    this.controller, {
    super.key,
    required this.scrollController,
  });

  final AddEditBoardController controller;
  final ScrollController scrollController;

  @override
  State<AddEditBoardLinks> createState() => _AddEditBoardLinksState();
}

class _AddEditBoardLinksState extends State<AddEditBoardLinks> {
  late final AddEditBoardSitesStore _store;

  @override
  void initState() {
    super.initState();
    _store = AddEditBoardSitesStore(
      widget.controller,
      widget.scrollController,
    );
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void addEditSite(BoardLink? link) async {
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
            boardUuid: widget.controller.boardUuid,
          ),
        ),
      ).then(_store.add);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontalPadding.copyWith(top: T20UI.spaceSize),
          child: const Labels('Links'),
        ),
        T20UI.spaceHeight,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: T20UI.screenContentSpaceSize,
          ),
          child: MainButton(
            label: 'Adicionar link',
            backgroundColor: palette.cardBackground,
            onTap: () => addEditSite(null),
          ),
        ),
        T20UI.spaceHeight,
        ValueListenableBuilder(
          valueListenable: _store.sites,
          builder: (_, links, __) {
            final list = links ?? [];

            return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              itemBuilder: (_, index) => AddEditBoardSiteCard(
                link: list[index],
                onRemove: _store.remove,
                onSelect: addEditSite,
              ),
              separatorBuilder: T20UI.separatorBuilderVertical,
              itemCount: list.length,
            );
          },
        )
      ],
    );
  }
}
