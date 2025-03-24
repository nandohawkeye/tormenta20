import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/add_magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_circles_selector/magic_circles_selector.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class AddMagicScreenBottomWidgets extends StatelessWidget {
  const AddMagicScreenBottomWidgets(this.store,
      {super.key, required this.multiSelect});

  final AddMagicsStore store;
  final bool multiSelect;

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
                      splashColor: palette.accent.withValues(alpha: .4),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MagicFilter(
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
          child: multiSelect
              ? Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        label: 'Confirmar',
                        onTap: () =>
                            Navigator.pop(context, store.selectedMagics),
                      ),
                    ),
                    SimpleCloseButton(backgroundColor: palette.cardBackground)
                  ],
                )
              : MainButton(
                  label: 'Voltar',
                  onTap: () => Navigator.pop(context),
                ),
        ),
        T20UI.safeAreaBottom(context)
      ],
    );
  }
}
