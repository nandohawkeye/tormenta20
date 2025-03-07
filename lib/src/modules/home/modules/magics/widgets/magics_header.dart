import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';

class MagicsHeader extends StatelessWidget {
  const MagicsHeader(this.store, {super.key});

  final MagicsStore store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.verticalPadding.copyWith(left: T20UI.spaceSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Labels('Magias'),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: store,
                builder: (_, __) => SimpleButton(
                  icon: FontAwesomeIcons.sliders,
                  backgroundColor: store.hasFilterAplied
                      ? palette.selected
                      : palette.background,
                  iconColor: store.hasFilterAplied ? palette.icon : null,
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MagicFilter(dto: store.toFilterDto()),
                      ),
                    ).then(
                      (value) {
                        if (value != null) {
                          store.changeFilters(value);
                        }
                      },
                    );
                  },
                ),
              ),
              AnimatedBuilder(
                animation: store,
                builder: (_, __) {
                  if (store.searchEnable) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: T20UI.spaceSize),
                    child: SimpleButton(
                      icon: FontAwesomeIcons.magnifyingGlass,
                      backgroundColor: palette.background,
                      onTap: () => store.changeSearchEnable(true),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
