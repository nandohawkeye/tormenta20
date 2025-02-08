import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_bottom_widgets.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_duration.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_executions.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_header.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_ranges.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_resistences.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_schools.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_types.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_filter_dto.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';
import 'package:tormenta20/src/shared/widgets/default_brackdrop_filter.dart';

class MagicFilterBottomsheet extends StatefulWidget {
  const MagicFilterBottomsheet({super.key, required this.dto});

  final MagicFilterDto dto;

  @override
  State<MagicFilterBottomsheet> createState() => _MagicFilterBottomsheetState();
}

class _MagicFilterBottomsheetState extends State<MagicFilterBottomsheet> {
  late final MagicFilterBottomsheetStore _store;
  @override
  void initState() {
    super.initState();
    _store = MagicFilterBottomsheetStore(widget.dto);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final limite = ((height - kToolbarHeight) / height);
    final initialSize = (limite * .9);

    return Stack(
      children: [
        const DefaultBrackdropFilter(),
        DraggableScrollableSheet(
            maxChildSize: limite,
            initialChildSize: initialSize,
            builder: (context, scrollController) {
              return Padding(
                padding: T20UI.allPaddingWithPaddingBottom(context),
                child: SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: palette.backgroundLevelOne,
                        borderRadius: T20UI.borderRadius),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MagicFilterBottomsheetHeader(),
                        const BottomSheetDivider(verticalPadding: 0),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            padding: const EdgeInsets.only(
                              left: T20UI.spaceSize - 4,
                              right: T20UI.spaceSize - 4,
                              bottom: T20UI.spaceSize,
                              top: T20UI.spaceSize,
                            ),
                            child: AnimatedBuilder(
                              animation: _store,
                              builder: (_, __) => Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MagicFilterBottomsheetTypes(
                                    itens: _store.types,
                                    itensSelected: _store.typesSelecteds,
                                    onTap: _store.onTap,
                                  ),
                                  T20UI.spaceHeight,
                                  MagicFilterBottomsheetRanges(
                                    itens: _store.ranges,
                                    itensSelected: _store.rangesSelecteds,
                                    onTap: _store.onTap,
                                  ),
                                  T20UI.spaceHeight,
                                  MagicFilterBottomsheetDuration(
                                    itens: _store.durations,
                                    itensSelected: _store.durationsSelecteds,
                                    onTap: _store.onTap,
                                  ),
                                  T20UI.spaceHeight,
                                  MagicFilterBottomsheetExecutions(
                                    itens: _store.executions,
                                    itensSelected: _store.executionsSelecteds,
                                    onTap: _store.onTap,
                                  ),
                                  T20UI.spaceHeight,
                                  MagicFilterBottomsheetResistences(
                                    itens: _store.resistencies,
                                    itensSelected: _store.resistenciesSelecteds,
                                    onTap: _store.onTap,
                                  ),
                                  T20UI.spaceHeight,
                                  MagicFilterBottomsheetSchools(
                                    itens: _store.schools,
                                    itensSelected: _store.schoolsSelecteds,
                                    onTap: _store.onTap,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        MagicFilterBottomsheetBottomWidgets(
                          store: _store,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
