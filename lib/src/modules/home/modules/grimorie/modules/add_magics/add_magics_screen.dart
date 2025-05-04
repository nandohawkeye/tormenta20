import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/widgets/add_magic_screen_bottom_widgets.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/widgets/add_magics_card.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/add_magics_store.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/widgets/screen_header.dart';

class AddMagicsScreen extends StatefulWidget {
  const AddMagicsScreen({
    super.key,
    required this.initialMagics,
    this.multiSelect = true,
  });

  final List<Magic> initialMagics;
  final bool multiSelect;

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
          RepaintBoundary(
            child: ScreenHeader(
                label:
                    'Selecione ${widget.multiSelect ? 'as magias' : 'a magia'}'),
          ),
          const Divider(),
          Expanded(
            child: RepaintBoundary(
              child: ListenableBuilder(
                listenable: _store,
                builder: (_, __) => _store.magics.isEmpty
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.ghost),
                          T20UI.smallSpaceWidth,
                          Text(
                            'Nenhuma magia disponível',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      )
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
                          multiSelect: widget.multiSelect,
                          onTap: _store.onSelectMagic,
                        ),
                      ),
              ),
            ),
          ),
          RepaintBoundary(
            child: AddMagicScreenBottomWidgets(
              _store,
              multiSelect: widget.multiSelect,
            ),
          )
        ],
      ),
    );
  }
}
