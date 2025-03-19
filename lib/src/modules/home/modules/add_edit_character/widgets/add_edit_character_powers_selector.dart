import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_power_bottomsheet/add_edit_power_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_store.dart';

class AddEditCharacterPowersSelector extends StatelessWidget {
  const AddEditCharacterPowersSelector({
    super.key,
    required this.store,
    required this.onAddDeleteList,
    required this.characterUuid,
  });

  final AddMultiStore<Power> store;
  final Function(Power) onAddDeleteList;
  final String characterUuid;

  @override
  Widget build(BuildContext context) {
    void onAdd(Power? power) async {
      await BottomsheetUtils.show<Power?>(
        context: context,
        child: AddEditPowerBottomsheet(
          initial: power,
          parentUuid: characterUuid,
        ),
      ).then(store.put);
    }

    return AddMultiField(
      label: 'Poderes',
      store: store,
      onAdd: onAdd,
      onRemove: (value) {
        onAddDeleteList(value);
        store.remove(value);
      },
    );
  }
}
