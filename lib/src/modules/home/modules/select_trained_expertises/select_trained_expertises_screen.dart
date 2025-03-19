import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/select_trained_expertises/select_trained_expertises_screen_card.dart';
import 'package:tormenta20/src/modules/home/modules/select_trained_expertises/select_trained_expertises_store.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class SelectTrainedExpertisesScreen extends StatefulWidget {
  const SelectTrainedExpertisesScreen({super.key, required this.initial});

  final List<ExpertiseBase> initial;

  @override
  State<SelectTrainedExpertisesScreen> createState() =>
      _SelectTrainedExpertisesScreenState();
}

class _SelectTrainedExpertisesScreenState
    extends State<SelectTrainedExpertisesScreen> {
  late final SelectTrainedExpertisesStore _store;

  @override
  void initState() {
    super.initState();
    _store = SelectTrainedExpertisesStore(widget.initial);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Pericías treinadas',
      onSaveLabel: 'Confirmar',
      onSave: () {
        final selects = _store.selectedExpertises;

        if (selects.isNotEmpty) {
          Navigator.pop(context, selects);
        }
      },
      body: AnimatedBuilder(
        animation: _store,
        builder: (_, __) {
          final expertises = _store.expertises;

          if (expertises.isEmpty) {
            return const SizedBox.shrink();
          }

          final selecteds = _store.selectedExpertises;

          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: T20UI.screenContentSpaceSize,
              vertical: T20UI.spaceSize,
            ),
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: expertises.length,
            separatorBuilder: T20UI.separatorBuilderVertical,
            itemBuilder: (_, index) {
              return SelectTrainedExpertisesScreenCard(
                expertise: expertises[index],
                selecteds: selecteds,
                onTap: _store.setSelectedExpertise,
              );
            },
          );
        },
      ),
    );
  }
}
