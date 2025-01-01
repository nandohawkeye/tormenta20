import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/widgets/add_magics_card.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/add_magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_filter_dto.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

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
          Column(
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
                          onChanged: _store.changeSearchFilter,
                          style: const TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Busque por nome ou palavra-chave',
                            fillColor: palette.cardBackground,
                            hintStyle: TextStyle(
                                fontSize: 16, color: palette.textPrimary),
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
                            splashColor: palette.primaryCTA.withOpacity(.4),
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
                            child: AnimatedBuilder(
                              animation: _store,
                              builder: (_, __) => Icon(
                                FontAwesomeIcons.sliders,
                                color: _store.hasFilterAplied
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
              const Divider(),
              Padding(
                padding: T20UI.allPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        label: 'Confirmar',
                        onTap: () =>
                            Navigator.pop(context, _store.selectedMagics),
                      ),
                    ),
                    T20UI.spaceWidth,
                    SimpleCloseButton(backgroundColor: palette.cardBackground)
                  ],
                ),
              ),
              T20UI.safeAreaBottom(context)
            ],
          )
        ],
      ),
    );
  }
}
