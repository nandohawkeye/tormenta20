import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_site_card.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_board_link/bottom_sheet_add_board_link.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardSites extends StatefulWidget {
  const AddEditBoardSites(this.controller, {super.key});

  final AddEditBoardController controller;

  @override
  State<AddEditBoardSites> createState() => _AddEditBoardSitesState();
}

class _AddEditBoardSitesState extends State<AddEditBoardSites> {
  late final ValueNotifier<List<BoardLink>?> _links;
  void _add(BoardLink? value) {
    if (value == null) {
      return;
    }

    List<BoardLink> oldValues = _links.value ?? [];
    _links.value = null;
    _links.value = [...oldValues, value];
    widget.controller.addLink(value);
  }

  void _remove(BoardLink value) {
    List<BoardLink> oldValues = _links.value ?? [];
    oldValues.removeWhere((od) => od.uuid == value.uuid);
    _links.value = [...oldValues];
    widget.controller.removeLink(value);
  }

  @override
  void initState() {
    super.initState();
    _links = ValueNotifier<List<BoardLink>?>(widget.controller.links);
  }

  @override
  void dispose() {
    _links.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void addEditSite() async {
      await showModalBottomSheet<BoardLink?>(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BottomSheetAddBoardLink(
            boardUuid: widget.controller.boardUuid,
          ),
        ),
      ).then(_add);
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
                    onTap: addEditSite,
                  ),
                ],
              ),
            ],
          ),
        ),
        T20UI.spaceHeight,
        ValueListenableBuilder(
          valueListenable: _links,
          builder: (_, links, __) {
            final list = links ?? [];
            if (list.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: T20UI.spaceSize - 4,
                ),
                child: MainButton(
                  label: 'Adicionar site',
                  backgroundColor: palette.cardBackground,
                  onTap: addEditSite,
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
                onRemove: _remove,
                onSelect: (_) {},
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
