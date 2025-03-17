import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/add_edit_action_screen.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_store.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';

class AddEditActionField extends StatelessWidget {
  const AddEditActionField({
    super.key,
    required this.store,
    required this.onAddDeleteList,
    required this.menaceUuid,
    required this.getEquipaments,
  });

  final AddMultiStore<ActionEnt> store;
  final Function(ActionEnt) onAddDeleteList;
  final String menaceUuid;
  final List<Equipment> Function() getEquipaments;

  @override
  Widget build(BuildContext context) {
    void onAdd(ActionEnt? action) async {
      final equipments = getEquipaments();
      await Navigator.push<ActionEnt?>(
        context,
        MaterialPageRoute(
          builder: (_) => AddEditActionScreen(
            initialAction: action,
            equipments: equipments,
            parentUuid: menaceUuid,
          ),
        ),
      ).then(store.put);
    }

    return AddMultiField(
      label: 'Ações',
      store: store,
      onAdd: onAdd,
      onRemove: (value) {
        onAddDeleteList(value);
        store.remove(value);
      },
    );
  }
}
