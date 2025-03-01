import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter_duration.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter_executions.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter_ranges.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter_resistences.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter_schools.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter_store.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter_types.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_filter_dto.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class MagicFilter extends StatefulWidget {
  const MagicFilter({super.key, required this.dto});

  final MagicFilterDto dto;

  @override
  State<MagicFilter> createState() => _MagicFilterState();
}

class _MagicFilterState extends State<MagicFilter> {
  late final MagicFilterStore _store;
  @override
  void initState() {
    super.initState();
    _store = MagicFilterStore(widget.dto);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Filtros ativos',
      onSave: () {
        final result = _store.onConfirmChanges();
        Navigator.pop(context, result);
      },
      body: Padding(
        padding: T20UI.horizontallScreenPadding,
        child: AnimatedBuilder(
          animation: _store,
          builder: (_, __) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              MagicFilterTypes(
                itens: _store.types,
                itensSelected: _store.typesSelecteds,
                onTap: _store.onTap,
              ),
              T20UI.spaceHeight,
              MagicFilterRanges(
                itens: _store.ranges,
                itensSelected: _store.rangesSelecteds,
                onTap: _store.onTap,
              ),
              T20UI.spaceHeight,
              MagicFilterDuration(
                itens: _store.durations,
                itensSelected: _store.durationsSelecteds,
                onTap: _store.onTap,
              ),
              T20UI.spaceHeight,
              MagicFilterExecutions(
                itens: _store.executions,
                itensSelected: _store.executionsSelecteds,
                onTap: _store.onTap,
              ),
              T20UI.spaceHeight,
              MagicFilterResistences(
                itens: _store.resistencies,
                itensSelected: _store.resistenciesSelecteds,
                onTap: _store.onTap,
              ),
              T20UI.spaceHeight,
              MagicFilterSchools(
                itens: _store.schools,
                itensSelected: _store.schoolsSelecteds,
                onTap: _store.onTap,
              ),
              T20UI.spaceHeight,
            ],
          ),
        ),
      ),
    );
  }
}
