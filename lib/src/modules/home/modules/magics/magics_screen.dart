import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_search_filter.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magics_wrap.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_filter_dto.dart';

class MagicsScreen extends StatefulWidget {
  const MagicsScreen({super.key});

  @override
  State<MagicsScreen> createState() => _MagicsScreenState();
}

class _MagicsScreenState extends State<MagicsScreen> {
  late final MagicsStore _store;

  @override
  void initState() {
    super.initState();
    _store = MagicsStore();
    _store.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: T20UI.allPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Labels('Grimórios'),
                      SimpleButton(
                        icon: FontAwesomeIcons.plus,
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: T20UI.allPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Labels('Magias'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SimpleButton(
                            icon: FontAwesomeIcons.sliders,
                            onTap: () async {
                              await showModalBottomSheet<MagicFilterDto?>(
                                isScrollControlled: true,
                                isDismissible: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: MagicFilterBottomsheet(
                                    dto: _store.toFilterDto(),
                                  ),
                                ),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    _store.changeFilters(value);
                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(width: 16),
                          SimpleButton(
                            icon: FontAwesomeIcons.magnifyingGlass,
                            onTap: () => _store.changeSearchEnable(true),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                MagicsWrap(store: _store)
              ],
            ),
          ),
          MagicSearchFilter(store: _store)
        ],
      ),
    );
  }
}
