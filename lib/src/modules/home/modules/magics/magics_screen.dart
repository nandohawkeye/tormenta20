import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magics/grimories_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/grimoire_header.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_circles_selector/magic_circles_selector.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_search_filter.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magics_header.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magics_wrap.dart';

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
