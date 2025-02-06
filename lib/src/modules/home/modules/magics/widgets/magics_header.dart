import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_filter_dto.dart';

class MagicsHeader extends StatelessWidget {
  const MagicsHeader(this.store, {super.key});

  final MagicsStore store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.allPadding,
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
                      ? palette.accent.withOpacity(.6)
                      : null,
                  iconColor: store.hasFilterAplied ? palette.icon : null,
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
                ),
              ),
              const SizedBox(width: 16),
              SimpleButton(
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => store.changeSearchEnable(true),
              )
            ],
          )
        ],
      ),
    );
  }
}
