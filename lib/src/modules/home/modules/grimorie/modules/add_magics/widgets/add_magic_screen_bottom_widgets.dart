import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/add_magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_circles_selector/magic_circles_selector.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_filter_dto.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class AddMagicScreenBottomWidgets extends StatelessWidget {
  const AddMagicScreenBottomWidgets(this.store, {super.key});

  final AddMagicsStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: T20UI.inputHeight,
                  child: TextField(
                    autofocus: false,
                    onChanged: store.changeSearchFilter,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Busque por nome ou palavra-chave',
                      fillColor: palette.backgroundLevelOne,
                      hintStyle:
                          TextStyle(fontSize: 16, color: palette.textPrimary),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 9,
                        horizontal: T20UI.spaceSize,
                      ),
                    ),
                  ),
                ),
              ),
              T20UI.spaceWidth,
              SizedBox(
                height: T20UI.inputHeight,
                width: T20UI.inputHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: T20UI.borderRadius,
                    color: palette.cardBackground,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: T20UI.borderRadius,
                      splashColor: palette.accent.withOpacity(.4),
                      onTap: () async {
                        await showModalBottomSheet<MagicFilterDto?>(
                          isScrollControlled: true,
                          isDismissible: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: MagicFilterBottomsheet(
                              dto: store.toFilterDto(),
                            ),
                          ),
                        ).then(
                          (value) {
                            if (value != null) {
                              store.changeFilters(value);
                            }
                          },
                        );
                      },
                      child: AnimatedBuilder(
                        animation: store,
                        builder: (_, __) => Icon(
                          FontAwesomeIcons.sliders,
                          color: store.hasFilterAplied
                              ? palette.primary
                              : palette.icon,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedBuilder(
          animation: store,
          builder: (_, __) {
            final selecteds = store.circlesSelecteds;
            return MagicCirclesSelector(
              selecteds: selecteds,
              onChangeCircleSelected: store.onChangeCircleSelected,
            );
          },
        ),
        T20UI.spaceHeight,
        const Divider(),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              Expanded(
                child: MainButton(
                  label: 'Confirmar',
                  onTap: () => Navigator.pop(context, store.selectedMagics),
                ),
              ),
              T20UI.spaceWidth,
              SimpleCloseButton(backgroundColor: palette.cardBackground)
            ],
          ),
        ),
        T20UI.safeAreaBottom(context)
      ],
    );
  }
}
