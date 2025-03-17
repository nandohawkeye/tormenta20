import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/add_edit_equipments_screen.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_store.dart';

class AddEditCharacterEquipmentSelector extends StatelessWidget {
  const AddEditCharacterEquipmentSelector({
    super.key,
    required this.store,
    required this.onAddDeleteList,
    required this.characterUuid,
  });

  final AddMultiStore<Equipment> store;
  final Function(Equipment) onAddDeleteList;
  final String characterUuid;

  @override
  Widget build(BuildContext context) {
    void onAdd(Equipment? equipament) async {
      await Navigator.push<Equipment?>(
        context,
        MaterialPageRoute(
          builder: (_) => AddEditEquipmentsScreen(
            equipament: equipament,
            parentUuid: characterUuid,
          ),
        ),
      ).then(store.put);
    }

    return AddMultiField(
      label: 'Equipamentos e itens',
      store: store,
      onAdd: onAdd,
      onRemove: (value) {
        onAddDeleteList(value);
        store.remove(value);
      },
    );
  }
}
