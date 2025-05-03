import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_materials/add_edit_baord_material_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_materials/add_edit_board_material_card.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardMaterials extends StatefulWidget {
  const AddEditBoardMaterials(this.controller, {super.key});

  final AddEditBoardController controller;

  @override
  State<AddEditBoardMaterials> createState() => _AddEditBoardMaterialsState();
}

class _AddEditBoardMaterialsState extends State<AddEditBoardMaterials> {
  late final AddEditBaordMaterialStore _store;

  @override
  void initState() {
    super.initState();
    _store = AddEditBaordMaterialStore(widget.controller);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontalPadding.copyWith(top: T20UI.spaceSize),
          child: const Labels('Materiais'),
        ),
        T20UI.spaceHeight,
        ValueListenableBuilder(
          valueListenable: _store.materials,
          builder: (_, materials, __) {
            final list = materials ?? [];
            if (list.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: T20UI.screenContentSpaceSize,
                ),
                child: MainButton(
                  label: 'Adicionar material',
                  backgroundColor: palette.cardBackground,
                  onTap: _store.onSelectFiles,
                ),
              );
            }

            //TODO ver no android

            return SizedBox(
              height: 120,
              child: ListView.builder(
                padding: T20UI.horizontalPadding,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemExtent: 120,
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return SizedBox(
                      height: 120,
                      width: 120,
                      child: Card(
                        child: InkWell(
                          borderRadius: T20UI.borderRadius,
                          onTap: _store.onSelectFiles,
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.plus,
                              size: 34,
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  return AddEditBoardMaterialCard(
                    material: list[index - 1],
                    onTap: _store.onRemove,
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
