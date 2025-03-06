import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace_expertise/add_edit_menace_expertise_screen.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_store.dart';

class AddEditMenaceExpertiseField extends StatelessWidget {
  const AddEditMenaceExpertiseField(
    this.store, {
    super.key,
    required this.onAddDeleteList,
    required this.menaceUuid,
  });

  final AddMultiStore<Expertise> store;
  final Function(String) onAddDeleteList;
  final String menaceUuid;

  @override
  Widget build(BuildContext context) {
    void onAdd(Expertise? expertise) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AddEditMenaceExpertiseScreen(
            expertise: expertise,
          ),
        ),
      );
    }

    return AddMultiField(
      label: 'Pericias',
      store: store,
      onAdd: onAdd,
      onRemove: (value) {
        onAddDeleteList(value.primaryKey);
        store.remove(value);
      },
    );
  }
}
