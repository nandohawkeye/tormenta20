import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/widgets/add_magic_screen_bottom_widgets.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/widgets/add_magics_card.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/add_magics_store.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';

class AddMagicsScreen extends StatefulWidget {
  const AddMagicsScreen({super.key, required this.initialMagics});

  final List<Magic> initialMagics;

  @override
  State<AddMagicsScreen> createState() => _AddMagicsScreenState();
}

class _AddMagicsScreenState extends State<AddMagicsScreen> {
  late final AddMagicsStore _store;

  @override
  void initState() {
    super.initState();
    _store = AddMagicsStore(widget.initialMagics);
    _store.init();
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kToolbarHeight),
          T20UI.spaceHeight,
          const Padding(
            padding: T20UI.horizontalPadding,
            child: Labels('Selecione as magias'),
          ),
          T20UI.spaceHeight,
          const Divider(),
          Expanded(
            child: AnimatedBuilder(
              animation: _store,
              builder: (_, __) => _store.magics.isEmpty
                  ? Center(
                      child: Text(
                      'Nenhuma magia disponível',
                      style: TextStyle(fontSize: 16, color: palette.primary),
                    ))
                  : ListView.separated(
                      padding: T20UI.allPadding,
                      shrinkWrap: true,
                      itemCount: _store.magics.length,
                      separatorBuilder: T20UI.separatorBuilderVertical,
                      itemBuilder: (_, index) => AddMagicsCard(
                        magic: _store.magics[index],
                        searchFilter: _store.searchFilter,
                        disabledMagics: _store.disabledMagics,
                        selectedMagics: _store.selectedMagics,
                        onTap: _store.onSelectMagic,
                      ),
                    ),
            ),
          ),
          AddMagicScreenBottomWidgets(_store)
        ],
      ),
    );
  }
}
