import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_magic_menace/add_edit_magic_menace_screen.dart';

import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_store.dart';

class AddEditMenaceScreenMagicsField extends StatelessWidget {
  const AddEditMenaceScreenMagicsField(
      {super.key,
      required this.store,
      required this.onAddDeleteList,
      required this.menaceUuid});

  final AddMultiStore<MagicMenace> store;
  final Function(String) onAddDeleteList;
  final String menaceUuid;

  @override
  Widget build(BuildContext context) {
    void onAdd(MagicMenace? magic) async {
      await Navigator.push<MagicMenace?>(
        context,
        MaterialPageRoute(
          builder: (_) => AddEditMagicMenaceScreen(
            magic: magic,
            menaceUuid: menaceUuid,
          ),
        ),
      ).then(store.put);
    }

    return AddMultiField(
      label: 'Magias',
      store: store,
      onAdd: onAdd,
      onRemove: (value) {
        onAddDeleteList(value.primaryKey);
        store.remove(value);
      },
    );
  }
}
