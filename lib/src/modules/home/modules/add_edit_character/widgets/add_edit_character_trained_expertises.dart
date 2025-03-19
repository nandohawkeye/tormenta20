import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/select_trained_expertises/select_trained_expertises_screen.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_store.dart';

class AddEditCharacterTrainedExpertises extends StatelessWidget {
  const AddEditCharacterTrainedExpertises({
    super.key,
    required this.store,
    required this.onAddDeleteList,
    required this.characterUuid,
  });

  final AddMultiStore<ExpertiseBase> store;
  final Function(ExpertiseBase) onAddDeleteList;
  final String characterUuid;

  @override
  Widget build(BuildContext context) {
    void onAdd(ExpertiseBase? action) async {
      await Navigator.push<List<ExpertiseBase>?>(
        context,
        MaterialPageRoute(
          builder: (_) => SelectTrainedExpertisesScreen(
            initial: store.data,
          ),
        ),
      ).then(store.putAll);
    }

    return AddMultiField(
      label: 'Pericías treinadas',
      store: store,
      onAdd: onAdd,
      onRemove: (value) {
        onAddDeleteList(value);
        store.remove(value);
      },
    );
  }
}
