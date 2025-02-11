import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_site_card.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_sites_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_board_link/bottom_sheet_add_board_link.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardSites extends StatefulWidget {
  const AddEditBoardSites(
    this.controller, {
    super.key,
    required this.scrollController,
  });

  final AddEditBoardController controller;
  final ScrollController scrollController;

  @override
  State<AddEditBoardSites> createState() => _AddEditBoardSitesState();
}

class _AddEditBoardSitesState extends State<AddEditBoardSites> {
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
          padding: T20UI.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Sites'),
              Row(
                children: [
                  SimpleButton(
                    icon: FontAwesomeIcons.plus,
                    onTap: () => addEditSite(null),
                  ),
                ],
              ),
            ],
          ),
        ),
        T20UI.spaceHeight,
        ValueListenableBuilder(
          valueListenable: _store.sites,
          builder: (_, sites, __) {
            final list = sites ?? [];
            if (list.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: T20UI.spaceSize - 4,
                ),
                child: MainButton(
                  label: 'Adicionar site',
                  backgroundColor: palette.cardBackground,
                  onTap: () => addEditSite(null),
                ),
              );
            }

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
