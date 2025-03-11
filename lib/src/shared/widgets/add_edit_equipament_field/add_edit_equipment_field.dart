import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/add_edit_equipments_screen.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_store.dart';

class AddEditEquipamentField extends StatelessWidget {
  const AddEditEquipamentField({
    super.key,
    required this.store,
    required this.onAddDeleteList,
    required this.menaceUuid,
  });

  final AddMultiStore<Equipment> store;
  final Function(Equipment) onAddDeleteList;
  final String menaceUuid;

  @override
  Widget build(BuildContext context) {
    void onAdd(Equipment? equipament) async {
      await Navigator.push<Equipment?>(
        context,
        MaterialPageRoute(
          builder: (_) => AddEditEquipmentsScreen(
            equipament: equipament,
            menaceUuid: menaceUuid,
          ),
        ),
      ).then(store.put);
    }

    return AddMultiField(
      label: 'Equipamentos',
      store: store,
      onAdd: onAdd,
      onRemove: (value) {
        onAddDeleteList(value);
        store.remove(value);
      },
    );
  }
}
