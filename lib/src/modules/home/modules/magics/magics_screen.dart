// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_grimorie/add_grimorie_screen.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/grimories_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/grimoire_header.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_circles_selector/magic_circles_selector.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_search_filter.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magics_header.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magics_wrap.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';

class MagicsScreen extends StatefulWidget {
  const MagicsScreen({super.key});

  @override
  State<MagicsScreen> createState() => _MagicsScreenState();
}

class _MagicsScreenState extends State<MagicsScreen> {
  late final MagicsStore _magicStore;
  late final GrimoriesStore _grimoriesStore;

  @override
  void initState() {
    super.initState();
    _magicStore = MagicsStore();
    _grimoriesStore = GetIt.I<GrimoriesStore>();
    _magicStore.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedBuilder(
        animation: _magicStore,
        builder: (_, __) => _magicStore.searchEnable
            ? const SizedBox.shrink()
            : SimpleButton(
                icon: FontAwesomeIcons.plus,
                backgroundColor: palette.selected,
                iconColor: palette.onSelected,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const AddGrimorieScreen(initialGrimoire: null),
                    ),
                  ).then(
                    (result) async {
                      if (result != null) {
                        await GetIt.I<AppDatabase>()
                            .grimoireDAO
                            .insertGrimoire(result)
                            .then((failure) {
                          if (failure == null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    GrimorieScreen(grimoire: result),
                              ),
                            );
                          }
                        });
                      }
                    },
                  );
                },
              ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedBuilder(
                  animation: _magicStore,
                  builder: (_, __) => _magicStore.searchEnable
                      ? const SizedBox.shrink()
                      : GrimoireHeader(_grimoriesStore),
                ),
                MagicsHeader(_magicStore),
                AnimatedBuilder(
                  animation: _magicStore,
                  builder: (_, __) {
                    final selecteds = _magicStore.circlesSelecteds;
                    return MagicCirclesSelector(
                      selecteds: selecteds,
                      onChangeCircleSelected:
                          _magicStore.onChangeCircleSelected,
                    );
                  },
                ),
                T20UI.spaceHeight,
                MagicsWrap(store: _magicStore),
                const SizedBox(height: 100)
              ],
            ),
          ),
          MagicSearchFilter(store: _magicStore)
        ],
      ),
    );
  }
}
